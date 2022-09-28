//
//  BrowseBreedsVC.swift
//  CatFancy
//
//  Created by Josh Adams on 9/25/22.
//

import UIKit

class BrowseBreedsVC: UIViewController {
  let deleSource: BrowseBreedsDeleSource
  private var loadingState: LoadingState = .notStarted
  private let photoCache = NSCache<NSString, UIImage>()
  private var isRefreshing = false
  private let onRequestFinished: ([Breed]) -> ()

  private var isRunningTests: Bool {
      return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
  }

  private var browseBreedsView: BrowseBreedsView {
    if let castedView = view as? BrowseBreedsView {
      return castedView
    } else {
      fatalError(fatalCastMessage(view: BrowseBreedsView.self))
    }
  }

  init(browseBreedsDelegate: BrowseBreedsDelegate, onRequestFinished: @escaping ([Breed]) -> () = { _ in }) {
    deleSource = BrowseBreedsDeleSource(browseBreedsDelegate: browseBreedsDelegate)
    self.onRequestFinished = onRequestFinished
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override func loadView() {
    view = BrowseBreedsView(frame: UIScreen.main.bounds)
    title = "Browse"
    browseBreedsView.setupTable(dataSource: deleSource, delegate: deleSource)
    browseBreedsView.refresh.addTarget(self, action: #selector(refreshBreeds(_:)), for: .valueChanged)
    browseBreedsView.retry.addTarget(self, action: #selector(retry), for: .touchUpInside)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    browseBreedsView.showLoadingState(loadingState)

    if loadingState == .notStarted {
      requestBreeds()
    } else if loadingState == .succeededWithBreeds {
      deleSource.sortBreeds()
      browseBreedsView.table.setContentOffset(.zero, animated: false)
    }
  }

  private func requestBreeds() {
    if isRunningTests {
      requestBreedsUsingClassicApproach()
    } else {
      requestBreedsUsingAsyncAwait()
    }
  }

  private func requestBreedsUsingClassicApproach() {
    loadingState = .loading
    browseBreedsView.showLoadingState(loadingState)

    BreedRequester.requestBreeds { breeds in
      DispatchQueue.main.async {
        if let breeds {
          self.deleSource.breeds = breeds
          self.deleSource.sortBreeds()
          if breeds.isEmpty {
            self.loadingState = .succeededWithNoBreeds
            Current.soundPlayer.play(.sadTrombone)
          } else {
            self.loadingState = .succeededWithBreeds
            Current.soundPlayer.play(.chime)
          }
        } else {
          self.deleSource.breeds = []
          self.loadingState = .failed
          Current.soundPlayer.play(.sadTrombone)
        }
        self.browseBreedsView.showLoadingState(self.loadingState)
        if self.isRefreshing {
          self.browseBreedsView.refresh.endRefreshing()
          self.isRefreshing = false
        }
        self.browseBreedsView.table.reloadData()
        self.onRequestFinished(self.deleSource.breeds)
      }
    }
  }

  private func requestBreedsUsingAsyncAwait() {
    loadingState = .loading
    browseBreedsView.showLoadingState(loadingState)
    Task {
      await requestBreedsAsync()
    }
  }

  private func requestBreedsAsync() async {
    defer {
      browseBreedsView.showLoadingState(loadingState)
      if isRefreshing {
        browseBreedsView.refresh.endRefreshing()
        isRefreshing = false
      }
      browseBreedsView.table.reloadData()
      onRequestFinished(deleSource.breeds)
    }

    do {
      let breeds = try await BreedRequester.requestBreeds()
      deleSource.breeds = breeds
      if breeds.isEmpty {
        self.loadingState = .succeededWithNoBreeds
        Current.soundPlayer.play(.sadTrombone)
      } else {
        deleSource.sortBreeds()
        loadingState = .succeededWithBreeds
        Current.soundPlayer.play(.chime)
      }
    } catch {
      deleSource.breeds = []
      loadingState = .failed
      Current.soundPlayer.play(.sadTrombone)
    }
  }

  @objc private func refreshBreeds(_ sender: Any) {
    isRefreshing = true
    requestBreeds()
  }

  @objc func retry() {
    requestBreeds()
  }
}
