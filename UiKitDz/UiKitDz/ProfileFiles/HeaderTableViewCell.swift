// HeaderTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка профиля
final class HeaderTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let nameUserLabelText = "Мария Иванова"
        static let jobUserLabelText = "Консультант"
        static let spaceXButtonText = "📎 www.spacex.com"
        static let editButtonText = "Изменить"
        static let shareProfileText = "Поделиться профилем"
        static let fontVerdanaBold = "Verdana-Bold"
        static let fontVerdana = "Verdana"
        static let leftRangeValue = 46.0
        static let leftRangeValueStep = 70.0
    }

    // MARK: - Visual Components

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .myAvatar
        return imageView
    }()

    private let nameUserLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdanaBold, size: 14)
        label.text = Constants.nameUserLabelText
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    private let jobUserLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdana, size: 14)
        label.textAlignment = .left
        label.text = Constants.jobUserLabelText
        label.textColor = .black
        return label
    }()

    lazy var spaceXButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.spaceXButtonText, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: 14)
        button.contentHorizontalAlignment = .left
        return button
    }()

    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.editButtonText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
        button.backgroundColor = .background
        button.layer.cornerRadius = 8
        return button
    }()

    private lazy var shareProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.shareProfileText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
        button.backgroundColor = .background
        button.layer.cornerRadius = 8
        return button
    }()

    private lazy var addUserButton: UIButton = {
        let button = UIButton()
        button.setImage(.usericon, for: .normal)
        button.backgroundColor = .background
        button.layer.cornerRadius = 8
        return button
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        addConstraints()
        addInformationUser()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
        addConstraints()
        addInformationUser()
    }

    // MARK: - Private Methods

    private func setupCell() {
        [
            avatarImageView,
            nameUserLabel,
            jobUserLabel,
            spaceXButton,
            editButton,
            shareProfileButton,
            addUserButton
        ].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    private func addConstraints() {
        constraintAvatarImageView()
        constraintLabel()
        addConstraintSpacex()
        addConstraintsDounButton()
    }

    private func constraintAvatarImageView() {
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func constraintLabel() {
        nameUserLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        nameUserLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 9).isActive = true
        nameUserLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        nameUserLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true

        jobUserLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        jobUserLabel.topAnchor.constraint(equalTo: nameUserLabel.bottomAnchor, constant: 11).isActive = true
        jobUserLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        jobUserLabel.widthAnchor.constraint(equalToConstant: 290).isActive = true
    }

    private func addConstraintSpacex() {
        spaceXButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18).isActive = true
        spaceXButton.topAnchor.constraint(equalTo: jobUserLabel.bottomAnchor, constant: 11).isActive = true
        spaceXButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
        spaceXButton.widthAnchor.constraint(equalToConstant: 290).isActive = true
    }

    private func addConstraintsDounButton() {
        editButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        editButton.topAnchor.constraint(equalTo: spaceXButton.bottomAnchor, constant: 11).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        editButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true

        shareProfileButton.leadingAnchor.constraint(equalTo: editButton.trailingAnchor, constant: 5).isActive = true
        shareProfileButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        shareProfileButton.widthAnchor.constraint(equalToConstant: 155).isActive = true
        shareProfileButton.centerYAnchor.constraint(equalTo: editButton.centerYAnchor).isActive = true

        addUserButton.leadingAnchor.constraint(equalTo: shareProfileButton.trailingAnchor, constant: 5).isActive = true
        addUserButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        addUserButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        addUserButton.centerYAnchor.constraint(equalTo: editButton.centerYAnchor).isActive = true
        addUserButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    }

    private func addInformationUser() {
        let userTitle = ["публикации", "подписчики", "подписки"]
        let userInformations = ["публикации": 67, "подписчики": 458, "подписки": 120]
        var leftRange = Constants.leftRangeValue
        for item in userTitle {
            let label = UILabel()
            label.text = String(userInformations[item] ?? 0)
            label.textAlignment = .center
            label.font = UIFont(name: Constants.fontVerdanaBold, size: 14)
            let titleLabel = UILabel()
            titleLabel.text = item
            titleLabel.textAlignment = .center
            titleLabel.font = UIFont(name: Constants.fontVerdana, size: 10)
            for item in [label, titleLabel] {
                item.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(item)
            }
            titleLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: leftRange)
                .isActive = true
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 41).isActive = true
            titleLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
            titleLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
            label.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
            label.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -2).isActive = true
            label.widthAnchor.constraint(equalToConstant: 50).isActive = true
            label.heightAnchor.constraint(equalToConstant: 17).isActive = true
            leftRange += Constants.leftRangeValueStep
        }
    }
}
