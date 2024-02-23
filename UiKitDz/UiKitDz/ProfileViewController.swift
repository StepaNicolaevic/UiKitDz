// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол обьекта истории
protocol StoryDelegate: AnyObject {
    /// Выбор нужной истории
    func setCurrentStory(story: StorySpace)
}

/// Экран профиля
final class ProfileViewController: UIViewController {
    // MARK: - Types

    /// Перечисление секций в профиле
    enum CellTypeProfile {
        /// Информация о пользователе
        case infoProfile
        /// Скролл историй пользователя
        case story
        /// Посты пользователя
        case posts
    }

    // MARK: - Constants

    private enum Constants {
        static let headerTableViewCellIdentifier = "HeaderTableViewCell"
        static let spaceTableViewCellViewCellIdentifier = "SpaceTableViewCell"
        static let spaceCollectionViewCellIdentifier = "CollectionPostTableViewCell"
    }

    // MARK: - Private Properties

    private let spaceImage = [
        "skyNight",
        "rocket",
        "earth",
        "oceanRocket",
        "skyNight",
        "rocket",
        "earth",
        "oceanRocket",
        "skyNight",
        "rocket",
        "earth",
        "oceanRocket"
    ]
    private let storySpace = StorySpace.makeStory()
    private let tableView = UITableView()
    private let content: [CellTypeProfile] = [.infoProfile, .story, .posts]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTable()
        configureNavigationBar()
    }

    // MARK: - Private Methods

    private func configureNavigationBar() {
        let lockButton = UIBarButtonItem(image: .lock, style: .done, target: nil, action: nil)
        lockButton.tintColor = .black
        let nameLabel = UIBarButtonItem(title: "mary_rmLink", style: .done, target: nil, action: nil)
        nameLabel.tintColor = .black
        nameLabel.setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont(name: "Verdana-Bold", size: 18) ?? UIFont.systemFont(ofSize: 6)],
            for: .normal
        )
        navigationItem.leftBarButtonItems = [lockButton, nameLabel]
        let plusButton = UIBarButtonItem(image: .plus, style: .plain, target: nil, action: nil)
        plusButton.tintColor = .black
        let rightButton = UIBarButtonItem(image: .list, style: .plain, target: nil, action: nil)
        rightButton.tintColor = .black
        navigationItem.rightBarButtonItems = [rightButton, plusButton]
    }

    private func configureView() {
        view.backgroundColor = .white
    }

    private func configureTable() {
        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
        tableView.allowsSelection = true
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: Constants.headerTableViewCellIdentifier)
        tableView.register(
            StorySpaceTableViewCell.self,
            forCellReuseIdentifier: Constants.spaceTableViewCellViewCellIdentifier
        )
        tableView.register(
            CollectionPostTableViewCell.self,
            forCellReuseIdentifier: Constants.spaceCollectionViewCellIdentifier
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    @objc private func goToWebsite() {
        let wKWebViewController = WKWebViewController()
        present(wKWebViewController, animated: true)
    }
}

// MARK: - NotificationsViewController + TableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        content.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cell = content[section]
        switch cell {
        case .infoProfile:
            return 1
        case .story:
            return 1
        case .posts:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items = content[indexPath.section]
        switch items {
        case .infoProfile:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.headerTableViewCellIdentifier,
                for: indexPath
            ) as? HeaderTableViewCell else { return UITableViewCell() }
            cell.spaceXButton.addTarget(self, action: #selector(goToWebsite), for: .touchUpInside)
            return cell
        case .story:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.spaceTableViewCellViewCellIdentifier,
                for: indexPath
            ) as? StorySpaceTableViewCell else { return UITableViewCell() }
            cell.updateCell(items: storySpace, delegate: self)
            return cell
        case .posts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.spaceCollectionViewCellIdentifier,
                for: indexPath
            ) as? CollectionPostTableViewCell else { return UITableViewCell() }
            cell.setupCell(image: spaceImage)
            return cell
        }
    }
}

// MARK: - Extension

/// Перенос истории
extension ProfileViewController: StoryDelegate {
    /// Переход  на следущий экран с разворотом истории
    func setCurrentStory(story: StorySpace) {
        let fullStoryViewController = FullStoryViewController()
        fullStoryViewController.currentStory = story
        present(fullStoryViewController, animated: true)
    }
}
