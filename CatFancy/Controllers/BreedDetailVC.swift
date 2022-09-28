//
//  BreedDetailVC.swift
//  CatFancy
//
//  Created by Josh Adams on 9/25/22.
//

import UIKit

class BreedDetailVC: UIViewController, UITextViewDelegate {
  private let breed: Breed
  private weak var breedDelegate: BreedDelegate?

  private var breedDetailView: BreedDetailView {
    if let castedView = view as? BreedDetailView {
      return castedView
    } else {
      fatalError(fatalCastMessage(view: BreedDetailView.self))
    }
  }

  init(breed: Breed, breedDelegate: BreedDelegate) {
    self.breed = breed
    self.breedDelegate = breedDelegate
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override func loadView() {
    view = BreedDetailView(frame: UIScreen.main.bounds)
    title = breed.name
    breedDetailView.descriptionTextView.delegate = self
    breedDetailView.descriptionTextView.text = breed.description
    breedDetailView.creditLabel.text = "Photo Credit: \(breed.credit)"

    ImageCacheLoader.requestImage(url: breed.photoUrl) { photo in
      if let photo {
        self.breedDetailView.photoImageView.image = photo
      }
    }

    breedDetailView.wikipediaButton.addTarget(self, action: #selector(viewInWikipedia), for: .touchUpInside)
    breedDetailView.licenseButton.addTarget(self, action: #selector(showLicense), for: .touchUpInside)
  }

  @objc func viewInWikipedia() {
    breedDelegate?.showWebpage(url: breed.infoUrl, didSucceed: nil)
  }

  @objc func showLicense() {
    breedDelegate?.showWebpage(url: breed.license.url, didSucceed: nil)
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let y = breedDetailView.descriptionTextView.contentOffset.y
    if y < BreedDetailView.initialPhotoHeightWidth {
      breedDetailView.updatePhotoSize(heightWidth: BreedDetailView.initialPhotoHeightWidth - y)
    } else {
      breedDetailView.updatePhotoSize(heightWidth: 0.0)
    }
  }
}
