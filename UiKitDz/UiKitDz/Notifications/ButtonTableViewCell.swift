// ButtonTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка уведомления с кнопкой
final class ButtonTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let subscribeButtonText = "Подписаться"
        static let fontVerdanaBold = "Verdana-Bold"
        static let fontVerdana = "Verdana"
        static let sizeText = 12
        static let avatarImageViewCornerRadius = 20
        static let subscribeButtonCornerRadius = 8
    }

    // MARK: - Visual Components

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = CGFloat(Constants.avatarImageViewCornerRadius)
        imageView.clipsToBounds = true
        return imageView
    }()

    private let postLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdana, size: CGFloat(Constants.sizeText))
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
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

    // MARK: - Public Methods

    func updateCell(subscribe: SubscribeUser) {
        avatarImageView.image = UIImage(named: subscribe.avatar)
        postLabel.text = subscribe.postText
    }

    // MARK: - Private Methods

    private func configureCell() {
        contentView.addSubview(subscribeButton)
        contentView.addSubview(postLabel)
        contentView.addSubview(avatarImageView)
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6).isActive = true

        postLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 7).isActive = true
        postLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
        postLabel.widthAnchor.constraint(equalToConstant: 154).isActive = true
        postLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true

        subscribeButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
        subscribeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        subscribeButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
