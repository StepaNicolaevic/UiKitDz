// StorySpaceView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью с историей
final class StorySpaceView: UIView {
    // MARK: - Constants

    private enum Constants {
        static let fontVerdana = "Verdana"
    }

    // MARK: - Visual Components

    private let spaceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameStoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdana, size: 10)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Public Properties

    weak var delegate: StoryDelegate?
    let tapStoryGestureRecognizer = UITapGestureRecognizer()

    // MARK: - Private Properties

    private var story: StorySpace?

    // MARK: - Initializers

    convenience init(story: StorySpace) {
        self.init()
        self.story = story
        updateView()
        spaceImageView.image = UIImage(named: story.nameImage)
        nameStoryLabel.text = story.nameTitle
    }

    // MARK: - Private Methods

    private func updateView() {
        addSubview(spaceImageView)
        addSubview(nameStoryLabel)
        translatesAutoresizingMaskIntoConstraints = false
        constraintForView()
        addGestureRecognizer(tapStoryGestureRecognizer)
        tapStoryGestureRecognizer.addTarget(self, action: #selector(tapView))
        isUserInteractionEnabled = true
    }

    private func constraintForView() {
        spaceImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        spaceImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        spaceImageView.heightAnchor.constraint(equalToConstant: 49).isActive = true
        spaceImageView.widthAnchor.constraint(equalToConstant: 49).isActive = true

        nameStoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nameStoryLabel.topAnchor.constraint(equalTo: spaceImageView.bottomAnchor, constant: 4).isActive = true
        nameStoryLabel.centerXAnchor.constraint(equalTo: spaceImageView.centerXAnchor).isActive = true
        nameStoryLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        nameStoryLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
    }

    @objc private func tapView() {
        guard let story = story else {
            return
        }
        delegate?.setCurrentStory(story: story)
    }
}
