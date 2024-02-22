// TabBarViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Таб бар для проекта
final class TabBarViewController: UITabBarController {
    private enum Constants {
        static let titleRibbon = "Лента"
        static let titleNotification = "Уведомления"
        static let titleProfile = "Профиль"
    }

    // MARK: - Visual Components

    private let feedViewController = FeedViewController()
    private let notificationsViewController = NotificationsViewController()
    private let profileViewController = ProfileViewController()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
    }

    // MARK: - Private Methods

    private func createTabBar() {
        let ribbonNavViewController = UINavigationController(rootViewController: feedViewController)
        ribbonNavViewController.tabBarItem = UITabBarItem(title: Constants.titleRibbon, image: .home, tag: 0)
        let notificationsNavViewController = UINavigationController(rootViewController: notificationsViewController)
        notificationsNavViewController.tabBarItem = UITabBarItem(
            title: Constants.titleNotification,
            image: .chat,
            tag: 1
        )
        let profileNavViewController = UINavigationController(rootViewController: profileViewController)
        profileNavViewController.tabBarItem = UITabBarItem(title: Constants.titleProfile, image: .profile, tag: 2)

        setViewControllers(
            [ribbonNavViewController, notificationsNavViewController, profileNavViewController],
            animated: true
        )
        tabBar.unselectedItemTintColor = .black
    }
}
