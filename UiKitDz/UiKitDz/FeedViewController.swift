// FeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Oсновной экран с лентой рекомедациями и сторисами
final class FeedViewController: UIViewController {
    // MARK: - Types

    /// Перечисление используеться для структурирования первого экрана
    enum CellTypePost {
        /// Скрол вью с горизонтальными ячейками
        case stories
        /// Первая публикация
        case firstPage
        /// Список рекомендованых друзей
        case recomed
        /// Все остальные публикации
        case pages
    }

    // MARK: - Constants

    private enum Constants {
        static let leftLabelText = "RMLink"
        static let fontDancingScript = "DancingScript-Medium"
        static let sizeTextLeftLabel = 22
        static let storiesCellIdentifier = "StoriesTableViewCell"
        static let mainCellIdentifier = "MainTableViewCell"
        static let recomendCellIdentifier = "RecomendTableViewCell"
        static let subscribeButtonCornerRadius = 8
        static let cancelButtonImage = "xmark"
    }

    // MARK: - Private Properties

    private let tableView: UITableView = .init()
    private let userStories = Story.makeUsers()
    private let userPosts = Post.makeImage()
    private let recomendedUsers = RecomendFriends.makeFriends()
    private let sections: [CellTypePost] = [.stories, .firstPage, .recomed, .pages]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureTableView()
    }

    // MARK: - Private Methods

    private func configureNavBar() {
        tableView.rowHeight = UITableView.automaticDimension
        view.backgroundColor = .white
        let leftLabel = UILabel()
        leftLabel.text = Constants.leftLabelText
        leftLabel.font = UIFont(name: Constants.fontDancingScript, size: CGFloat(Constants.sizeTextLeftLabel))
        leftLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: leftLabel)
        navigationItem.leftBarButtonItem = leftItem
        let rightItem = UIBarButtonItem(image: .icon, style: .plain, target: self, action: nil)
        rightItem.tintColor = .black
        navigationItem.rightBarButtonItem = rightItem
    }

    private func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(StoriesTableViewCell.self, forCellReuseIdentifier: Constants.storiesCellIdentifier)
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: Constants.mainCellIdentifier)
        tableView.register(RecomendTableViewCell.self, forCellReuseIdentifier: Constants.recomendCellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.reloadData()
    }
}

// MARK: - FeedViewController + TableViewDataSource

extension FeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cell = sections[section]
        switch cell {
        case .stories, .firstPage, .recomed:
            return 1
        case .pages:
            return userPosts.count - 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items = sections[indexPath.section]
        switch items {
        case .stories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.storiesCellIdentifier,
                for: indexPath
            ) as? StoriesTableViewCell
            else { return UITableViewCell() }
            cell.updateCell(items: userStories)
            return cell
        case .firstPage:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.mainCellIdentifier,
                for: indexPath
            ) as? MainTableViewCell
            else { return UITableViewCell() }
            cell.configureCell(post: userPosts[0])
            return cell
        case .recomed:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.recomendCellIdentifier,
                for: indexPath
            ) as? RecomendTableViewCell
            else { return UITableViewCell() }

            cell.setupCell(user: recomendedUsers)
            return cell
        case .pages:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.mainCellIdentifier,
                for: indexPath
            ) as? MainTableViewCell
            else { return UITableViewCell() }

            cell.configureCell(post: userPosts[indexPath.row + 1])
            return cell
        }
    }
}
