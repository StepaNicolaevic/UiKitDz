// FullStoryViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран показа сторис
final class FullStoryViewController: UIViewController {
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
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var myProgressView = UIProgressView()

    // MARK: - Public Properties

    var currentStory: StorySpace = .init(nameImage: "", nameTitle: "")
    private var myTime = Timer()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addConstrains()
        createTimer()
        createProgress()
    }

    // MARK: - Private Methods

    private func createTimer() {
        myTime = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateProgressView),
            userInfo: nil,
            repeats: true
        )
    }

    private func setupView() {
        if let backgroundImage = UIImage(named: "startRocket") {
            view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
        spaceImageView.image = UIImage(named: currentStory.nameImage)
        nameStoryLabel.text = currentStory.nameTitle
        view.addSubview(spaceImageView)
        view.addSubview(nameStoryLabel)
    }

    private func createProgress() {
        view.addSubview(myProgressView)
        myProgressView.translatesAutoresizingMaskIntoConstraints = false
        myProgressView.progressViewStyle = .bar
        myProgressView.setProgress(0.0, animated: true)
        myProgressView.progressTintColor = .white
        myProgressView.trackTintColor = .gray
        myProgressView.topAnchor.constraint(equalTo: view.topAnchor, constant: 11).isActive = true
        myProgressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        myProgressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        myProgressView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    private func addConstrains() {
        spaceImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 23).isActive = true
        spaceImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7).isActive = true
        spaceImageView.widthAnchor.constraint(equalToConstant: 27).isActive = true
        spaceImageView.heightAnchor.constraint(equalToConstant: 27).isActive = true

        nameStoryLabel.centerYAnchor.constraint(equalTo: spaceImageView.centerYAnchor).isActive = true
        nameStoryLabel.leadingAnchor.constraint(equalTo: spaceImageView.trailingAnchor, constant: 8).isActive = true
        nameStoryLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
        nameStoryLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    @objc private func updateProgressView() {
        myProgressView.progress += 0.05
        if myProgressView.progress == 1 {
            dismiss(animated: true)
        }
    }
}
