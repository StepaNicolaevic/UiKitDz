// RecomendView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью сторис в которой никнейм и картинка
final class RecomendView: UIView {
    // MARK: - Constants

    enum Constants {
        static let subscribeButtonText = "Подписаться"
        static let fontVerdanaBold = "Verdana-Bold"
        static let fontVerdana = "Verdana"
        static let sizeText = 10
        static let avatarImageViewCornerRadius = 57
        static let subscribeButtonCornerRadius = 8
        static let cancelButtonImage = "xmark"
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

    private let subscribeButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.subscribeButtonText, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: CGFloat(Constants.sizeText))
        button.backgroundColor = .blueProj
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = CGFloat(Constants.subscribeButtonCornerRadius)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let cancelButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(systemName: Constants.cancelButtonImage), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializers

    convenience init(recomend: RecomendFriends) {
        self.init()
        avatarImageView.image = UIImage(named: recomend.avatar)
        nameLabel.text = recomend.name
        configureView()
        setConstraintAvatarImageView()
        setConstraintNameLabel()
        setConstraintButtons()
    }

    // MARK: - Private Methods

    private func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(cancelButton)
        addSubview(subscribeButton)
        backgroundColor = .white
    }

    private func setConstraintAvatarImageView() {
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true
    }

    private func setConstraintNameLabel() {
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 42).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -42).isActive = true
        nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 5).isActive = true
    }

    private func setConstraintButtons() {
        subscribeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        subscribeButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 14).isActive = true
        subscribeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9).isActive = true
        cancelButton.topAnchor.constraint(equalTo: topAnchor, constant: 9).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 7).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 7).isActive = true
    }
}
