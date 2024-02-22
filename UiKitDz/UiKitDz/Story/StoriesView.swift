// StoriesView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью сторис
final class StoriesView: UIView {
    // MARK: - Constants

    private enum Constants {
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

    private let nameUserLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdana, size: CGFloat(Constants.sizeText))
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers

    convenience init(history: Story) {
        self.init()
        updateView()
        avatarImageView.image = UIImage(named: history.avatar)
        nameUserLabel.text = history.name
    }

    // MARK: - Public Methods

    func editFirstLabel() {
        nameUserLabel.textColor = .gray
        avatarImageView.layer.cornerRadius = 0
    }

    // MARK: - Private Methods

    private func updateView() {
        addSubview(avatarImageView)
        addSubview(nameUserLabel)
        translatesAutoresizingMaskIntoConstraints = false
        constraintForView()
    }

    private func constraintForView() {
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true

        nameUserLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        nameUserLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nameUserLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        nameUserLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 5).isActive = true
    }
}
