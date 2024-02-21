// RecomendTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка таблицы с рекомендациями
final class RecomendTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let recomendYouLabelText = "Рекомендуем вам"
        static let fontVerdana = "Verdana-Bold"
        static let sizeTextLabel = 10
        static let allUsersButtonText = "Все"
        static let scrollStep = 205
        static let widthStep = 210
    }

    // MARK: - Visual Components

    private let scrollView = UIScrollView()

    private let recomendYouLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdana, size: CGFloat(Constants.sizeTextLabel))
        label.textAlignment = .left
        label.text = Constants.recomendYouLabelText
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let allUsersButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.allUsersButtonText, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: CGFloat(Constants.sizeTextLabel))
        button.setTitleColor(.blueProj, for: .normal)
        button.contentHorizontalAlignment = .right
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        actionConstraite()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
        actionConstraite()
    }

    // MARK: - Public Methods

    func setupCell(user: [RecomendFriends]) {
        var startWidth = 0
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = true
        var startScroll: CGFloat = 0
        for index in 0 ..< user.count {
            let storyCell = RecomendView(recomend: user[index])
            scrollView.addSubview(storyCell)
            storyCell.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: startScroll).isActive = true
            storyCell.topAnchor.constraint(equalTo: topAnchor, constant: 45).isActive = true
            storyCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25).isActive = true
            storyCell.heightAnchor.constraint(equalToConstant: 200).isActive = true
            storyCell.widthAnchor.constraint(equalToConstant: 185).isActive = true
            storyCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20).isActive = true
            startScroll += CGFloat(Constants.scrollStep)
            startWidth += Constants.widthStep
        }
        scrollView.contentSize = CGSize(width: startWidth, height: 200)
    }

    // MARK: - Private Methods

    private func setupCell() {
        contentView.backgroundColor = .blueBackground
        contentView.addSubview(scrollView)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        contentView.addSubview(recomendYouLabel)
        contentView.addSubview(allUsersButton)
    }

    private func actionConstraite() {
        contentView.heightAnchor.constraint(equalToConstant: 260).isActive = true
        recomendYouLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        recomendYouLabel.topAnchor.constraint(equalTo: topAnchor, constant: 9).isActive = true
        recomendYouLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        recomendYouLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true

        allUsersButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        allUsersButton.topAnchor.constraint(equalTo: topAnchor, constant: 9).isActive = true
        allUsersButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        allUsersButton.widthAnchor.constraint(equalToConstant: 107).isActive = true

        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
}
