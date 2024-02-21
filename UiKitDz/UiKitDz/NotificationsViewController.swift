// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран уведомлений пользователя
final class NotificationsViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let buttonCellIdentifier = "ButtonTableViewCell"
        static let postCellIdentifier = "PostTableViewCell"
        static let navigationItemTitleText = "Уведомления"
        static let titleRequestText = "Запросы на подписку"
        static let titleTodayText = "Сегодня"
        static let titleThisWeakText = "На этой неделе"
    }

    // MARK: - Private Properties

    private let todayType = PostNotification.makePost()
    private let thisWeakType: [Any] = [
        PostNotification(
            postText: "lavanda123 понравился ваш комментарий: Это где? 3д.",
            avatar: "iam",
            postImage: "ocean"
        ),
        Subscriber(postText: "12miho появился(-ась) в RMLink. Вы можете быть знакомы 3д.", avatar: "iam"),
        PostNotification(
            postText: "lavanda123 понравился ваш комментарий: Ты вернулась? 7д.",
            avatar: "iam",
            postImage: "ocean"
        ),
        Subscriber(postText: "lavanda123 подписался(-ась) на ваши новости 5д.", avatar: "iam"),
        Subscriber(postText: "markS появился(-ась) в RMLink. Вы можете быть знакомы 8д.", avatar: "iam"),
        Subscriber(postText: "sv_neit появился(-ась) в RMLink. Вы можете быть знакомы 8д.", avatar: "iam")
    ]
    /// Перечисление секций в уведомлениях
    enum CellTypeNotifications {
        /// Запросы на добавление
        case request
        /// Уведомления которые пришли сегодня
        case today
        /// Уведомления на этой неделе
        case thisWeak
    }

    private let tableView: UITableView = .init()

    private let content: [CellTypeNotifications] = [.request, .today, .thisWeak]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTable()
    }

    // MARK: - Private Methods

    private func configureView() {
        tableView.rowHeight = UITableView.automaticDimension
        view.backgroundColor = .white
        navigationItem.title = Constants.navigationItemTitleText
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func configureTable() {
        view.addSubview(tableView)
        tableView.allowsSelection = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: Constants.buttonCellIdentifier)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: Constants.postCellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.reloadData()
    }
}

// MARK: - Extension NotificationsViewController + TableViewDataSource

extension NotificationsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        content.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cell = content[section]
        switch cell {
        case .request:
            return 1
        case .today:
            return todayType.count
        case .thisWeak:
            return thisWeakType.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items = content[indexPath.section]
        switch items {
        case .request:
            return UITableViewCell()
        case .today:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.postCellIdentifier,
                for: indexPath
            ) as? PostTableViewCell
            else { return UITableViewCell() }
            cell.updateCell(post: todayType[indexPath.row])
            return cell
        case .thisWeak:
            if let userPost = thisWeakType[indexPath.row] as? Subscriber {
                if let cell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.buttonCellIdentifier,
                    for: indexPath
                ) as? ButtonTableViewCell {
                    cell.configure(subscriber: userPost)
                    return cell
                }
            } else if let userPost = thisWeakType[indexPath.row] as? PostNotification {
                if let cell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.postCellIdentifier,
                    for: indexPath
                ) as? PostTableViewCell {
                    cell.updateCell(post: userPost)
                    return cell
                }
            }
        }
        return UITableViewCell()
    }
}

// MARK: - Extension TableViewDelegate

extension NotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch content[section] {
        case .request:
            return Constants.titleRequestText
        case .today:
            return Constants.titleTodayText
        case .thisWeak:
            return Constants.titleThisWeakText
        }
    }
}
