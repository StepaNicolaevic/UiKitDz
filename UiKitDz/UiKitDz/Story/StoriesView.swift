// StoriesView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка сторис
final class StoriesView: UIView {
    // MARK: - Constants

    enum Constants {
        static let fontVerdana = "Verdana"
        static let sizeText = 8
        static let avatarImageViewCornerRadius = 30
    }

    // MARK: - Visual Components

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = CGFloat(Constants.avatarImageViewCornerRadius)
        imageView.clipsToBounds = true
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdana, size: CGFloat(Constants.sizeText))
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers

    convenience init(history: ScrollStrories) {
        self.init()
        addSubview(avatarImageView)
        addSubview(nameLabel)
        translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = UIImage(named: history.avatar)
        nameLabel.text = history.name
        configureView()
    }

    // MARK: - Public Methods

    func editFirstLabel() {
        nameLabel.textColor = .gray
        avatarImageView.layer.cornerRadius = 0
    }

    // MARK: - Private Methods

    private func configureView() {
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true

        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 5).isActive = true
    }
}
