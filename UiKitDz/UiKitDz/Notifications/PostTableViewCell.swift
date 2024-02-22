// PostTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка уведомления  с постом
final class PostTableViewCell: UITableViewCell {
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

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        addConstraint()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureCell()
        addConstraint()
    }

    // MARK: - Public Methods

    func updateCell(post: PostNotification) {
        avatarImageView.image = UIImage(named: post.avatar)
        postLabel.text = post.postText
        postImageView.image = UIImage(named: post.postImage)
    }

    // MARK: - Private Methods

    private func configureCell() {
        contentView.addSubview(postImageView)
        contentView.addSubview(postLabel)
        contentView.addSubview(avatarImageView)
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6).isActive = true
    }

    private func addConstraint() {
        postLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 7).isActive = true
        postLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
        postLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        postLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

        postImageView.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
        postImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        postImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        postImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
