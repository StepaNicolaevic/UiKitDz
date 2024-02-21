// MainTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейки с постами пользователя
final class MainTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let fontVerdanaBold = "Verdana-Bold"
        static let fontVerdana = "Verdana"
        static let countLikeLabelText = "Нравиться: 201"
        static let commentTextFieldText = "Комментировать"
        static let timeAgoLabelText = "10 минут назад"
    }

    // MARK: - Visual Components

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = .iam
        return imageView
    }()

    private let nameUserLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdana, size: 12)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .iam
        return imageView
    }()

    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(.like, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let messedgeButton: UIButton = {
        let button = UIButton()
        button.setImage(.mesedge, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let aiplaneButton: UIButton = {
        let button = UIButton()
        button.setImage(.airpalane, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let saveButton: UIButton = {
        let button = UIButton()
        button.setImage(.save, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let countLikeLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.countLikeLabelText
        label.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let commentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let acountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.image = .friends
        return imageView
    }()

    private let commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.commentTextFieldText
        textField.font = UIFont(name: Constants.fontVerdana, size: 10)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let timeAgoLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.timeAgoLabelText
        label.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
        label.textColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let pageController = UIPageControl()
    private let scrollView = UIScrollView()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        addConstraint()
        addSecondConstraint()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func setupCell(setPost: MyMainFeednCell) {
        var xCoodinate = 0
        if setPost.mainImage.count <= 1 {
            mainImageView.image = UIImage(named: setPost.mainImage[0])
        } else {
            for image in setPost.mainImage {
                contentView.addSubview(pageController)
                contentView.addSubview(scrollView)
                pageController.numberOfPages = setPost.mainImage.count
                let imageView = UIImageView()
                imageView.image = UIImage(named: image)
                imageView.frame = CGRect(x: xCoodinate, y: 0, width: Int(UIScreen.main.bounds.width), height: 240)
                scrollView.addSubview(imageView)
                xCoodinate += Int(UIScreen.main.bounds.width)
                pageController.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
                pageController.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
                scrollView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10).isActive = true
                scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
                scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
                scrollView.heightAnchor.constraint(equalToConstant: 240).isActive = true
            }
        }
        commentLabel.text = setPost.commentPage
        nameUserLabel.text = setPost.nameAccount
        avatarImageView.image = UIImage(named: setPost.avatarAccount)
    }

    // MARK: - Private Methods

    private func configureCell() {
        [
            timeAgoLabel,
            commentTextField,
            acountImageView,
            avatarImageView,
            countLikeLabel,
            saveButton,
            aiplaneButton,
            messedgeButton,
            mainImageView,
            likeButton,
            nameUserLabel,
            commentLabel
        ].forEach { contentView.addSubview($0) }
        selectionStyle = .none
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        pageController.translatesAutoresizingMaskIntoConstraints = false
        pageController.pageIndicatorTintColor = .gray
        pageController.currentPageIndicatorTintColor = .black
        pageController.addTarget(self, action: #selector(pageDidChange(sender:)), for: .valueChanged)
        pageController.backgroundStyle = .automatic
    }

    private func addConstraint() {
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true

        nameUserLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
        nameUserLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 6).isActive = true
        nameUserLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameUserLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true

        mainImageView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 240).isActive = true

        likeButton.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10).isActive = true
        likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 18).isActive = true

        messedgeButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        messedgeButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 11).isActive = true
        messedgeButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        messedgeButton.widthAnchor.constraint(equalToConstant: 18).isActive = true

        aiplaneButton.centerYAnchor.constraint(equalTo: messedgeButton.centerYAnchor).isActive = true
        aiplaneButton.leadingAnchor.constraint(equalTo: messedgeButton.trailingAnchor, constant: 11).isActive = true
        aiplaneButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        aiplaneButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
    }

    private func addSecondConstraint() {
        saveButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 18).isActive = true

        countLikeLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 6).isActive = true
        countLikeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        countLikeLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        countLikeLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true

        commentLabel.topAnchor.constraint(equalTo: countLikeLabel.bottomAnchor, constant: 6).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        commentLabel.widthAnchor.constraint(equalToConstant: 360).isActive = true
        commentLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        acountImageView.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 4).isActive = true
        acountImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        acountImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        acountImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true

        commentTextField.centerYAnchor.constraint(equalTo: acountImageView.centerYAnchor).isActive = true
        commentTextField.leadingAnchor.constraint(equalTo: acountImageView.trailingAnchor, constant: 3).isActive = true
        commentTextField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        commentTextField.heightAnchor.constraint(equalToConstant: 15).isActive = true

        timeAgoLabel.topAnchor.constraint(equalTo: acountImageView.bottomAnchor, constant: 4).isActive = true
        timeAgoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        timeAgoLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        timeAgoLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        timeAgoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    @objc private func pageDidChange(sender: UIPageControl) {
        let ofSetX = UIScreen.main.bounds.width * CGFloat(pageController.currentPage)
        scrollView.setContentOffset(CGPoint(x: ofSetX, y: 0), animated: true)
    }
}

// MARK: - Extension UIScrollViewDelegate

extension MainTableViewCell: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
