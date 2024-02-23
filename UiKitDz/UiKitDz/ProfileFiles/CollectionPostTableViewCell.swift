// CollectionPostTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с коолекцией картинок
final class CollectionPostTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let spaceCollectionViewCellIdentifier = "SpaceCollectionViewCell"
        static let thirdOfTheScreen = Int(UIScreen.main.bounds.width) / 3
    }

    // MARK: - Visual Components

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 0.5
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.itemSize = CGSize(
            width: Constants.thirdOfTheScreen - 1,
            height: Constants.thirdOfTheScreen - 1
        )
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    // MARK: - Private Properties

    private var containerImage: [String] = []

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureCell()
    }

    // MARK: - Public Method

    func setupCell(image: [String]) {
        containerImage = image
        let heightCollection = ((containerImage.count) / 3) * Constants.thirdOfTheScreen
        contentView.heightAnchor.constraint(equalToConstant: CGFloat(heightCollection)).isActive = true
    }

    // MARK: - Private Methods

    private func configureCell() {
        contentView.addSubview(collectionView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        collectionView.dataSource = self
        collectionView.register(
            SpaceCollectionViewCell.self,
            forCellWithReuseIdentifier: Constants.spaceCollectionViewCellIdentifier
        )
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

// MARK: - CollectionPostTableViewCell + UICollectionViewDataSource

extension CollectionPostTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        containerImage.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.spaceCollectionViewCellIdentifier,
            for: indexPath
        ) as? SpaceCollectionViewCell else { return UICollectionViewCell() }
        cell.setupCell(image: containerImage[indexPath.item])
        return cell
    }
}
