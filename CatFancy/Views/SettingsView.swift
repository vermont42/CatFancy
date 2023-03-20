// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import UIKit

class SettingsView: UIView {
  @UsesAutoLayout
  private var breedsURLLabel: UILabel = {
    let breedsURLLabel = UILabel()
    breedsURLLabel.text = "Breeds URL"
    breedsURLLabel.font = Fonts.heading
    return breedsURLLabel
  }()

  @UsesAutoLayout
  private(set) var breedsURLControl: UISegmentedControl = {
    var items: [String] = []
    BreedsURL.allCases.forEach {
      items.append($0.displayName)
    }
    return UISegmentedControl(items: items)
  }()

  @UsesAutoLayout
  private var breedsURLDescription: UILabel = {
    let breedsURLDescription = UILabel()
    breedsURLDescription.text = "This setting controls the URL of the JSON file that the breeds-browsing screen retrieves. If you change this setting, pull down the breeds table to refresh it or, if the error or no-breeds state is showing, tap Retry."
    breedsURLDescription.numberOfLines = 0
    breedsURLDescription.lineBreakMode = .byWordWrapping
    breedsURLDescription.font = Fonts.smallBody
    return breedsURLDescription
  }()

  @UsesAutoLayout
  private var sortOrderLabel: UILabel = {
    let sortOrderLabel = UILabel()
    sortOrderLabel.text = "Sort Order"
    sortOrderLabel.font = Fonts.heading
    return sortOrderLabel
  }()

  @UsesAutoLayout
  private(set) var sortOrderControl: UISegmentedControl = {
    var items: [String] = []
    SortOrder.allCases.forEach {
      items.append($0.displayName)
    }
    return UISegmentedControl(items: items)
  }()

  @UsesAutoLayout
  private var sortOrderDescription: UILabel = {
    let sortOrderDescription = UILabel()
    sortOrderDescription.text = "This setting controls the sort order of breeds: by name or by popularity."
    sortOrderDescription.numberOfLines = 0
    sortOrderDescription.lineBreakMode = .byWordWrapping
    sortOrderDescription.font = Fonts.smallBody
    return sortOrderDescription
  }()

  required init(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .secondarySystemBackground

    [
      breedsURLLabel, breedsURLControl, breedsURLDescription,
      sortOrderLabel, sortOrderControl, sortOrderDescription
    ].forEach {
      addSubview($0)
    }

    breedsURLLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.defaultSpacing).activate()
    breedsURLLabel.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    breedsURLLabel.bottomAnchor.constraint(equalTo: breedsURLControl.topAnchor, constant: Layout.defaultSpacing * -1.0).activate()

    breedsURLControl.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.defaultHorizontalMargin).activate()
    breedsURLControl.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.defaultHorizontalMargin * -1.0).activate()

    breedsURLDescription.topAnchor.constraint(equalTo: breedsURLControl.bottomAnchor, constant: Layout.defaultSpacing).activate()
    breedsURLDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.defaultHorizontalMargin).activate()
    breedsURLDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.defaultHorizontalMargin * -1.0).activate()

    sortOrderLabel.topAnchor.constraint(equalTo: breedsURLDescription.bottomAnchor, constant: Layout.defaultSpacing).activate()
    sortOrderLabel.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    sortOrderLabel.bottomAnchor.constraint(equalTo: sortOrderControl.topAnchor, constant: Layout.defaultSpacing * -1.0).activate()

    sortOrderControl.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.defaultHorizontalMargin).activate()
    sortOrderControl.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.defaultHorizontalMargin * -1.0).activate()

    sortOrderDescription.topAnchor.constraint(equalTo: sortOrderControl.bottomAnchor, constant: Layout.defaultSpacing).activate()
    sortOrderDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.defaultHorizontalMargin).activate()
    sortOrderDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.defaultHorizontalMargin * -1.0).activate()
  }
}
