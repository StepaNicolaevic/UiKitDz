// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// class viewcontroller
class ProfileViewController: UIViewController {
    // MARK: - Types

    private enum CellTypes {
        case profile
        case options
    }

    // MARK: - Constants

    private enum Constants {
        static let mainTableViewCellIdentifier = "MainTableViewCell"
        static let otherTableViewCellIdentifier = "OtherTableViewCell"
    }

    // MARK: - Public Properties

    var profilePresenter: ProfilePresenter?

    // MARK: - Private Properties

    private var tableView = UITableView()
    private let content: [CellTypes] = [.profile, .options]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        view.backgroundColor = .white
    }

    // MARK: - Private Methods

    private func configureTable() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: Constants.mainTableViewCellIdentifier)
        tableView.register(OtherTableViewCell.self, forCellReuseIdentifier: Constants.otherTableViewCellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        content.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let countRow = content[section]
        switch countRow {
        case .profile:
            return 1
        case .options:
            return 3
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items = content[indexPath.section]
        switch items {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.mainTableViewCellIdentifier, for: indexPath
            )
                as? MainTableViewCell else { return UITableViewCell() }
            guard let profile = profilePresenter?.profileUser else { return UITableViewCell() }
            cell.setupCell(profile: profile)

            return cell
        case .options:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier:
                Constants.otherTableViewCellIdentifier,
                for: indexPath
            ) as? OtherTableViewCell
            else { return UITableViewCell() }
            guard let options = profilePresenter?.options else { return UITableViewCell() }
            cell.setupCell(options: options[indexPath.row])
            return cell
        }
    }
}

extension ProfileViewController: ProfileViewProtocol {}
