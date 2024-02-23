// SpaceCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка коллекций
final class SpaceCollectionViewCell: UICollectionViewCell {
    // MARK: - Visual Components

    private let spaceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Public Methods

    func setupCell(image: String) {
        contentView.addSubview(spaceImageView)
        spaceImageView.image = UIImage(named: image)
        spaceImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        spaceImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        spaceImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        spaceImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
