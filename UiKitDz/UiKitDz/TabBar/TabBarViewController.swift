// TabBarViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Таб бар для проекта
class TabBarViewController: UITabBarController {
    enum Constants {
        static let titleRibbon = "Лента"
        static let titleNotification = "Уведомления"
        static let titleProfile = "Профиль"
    }

    // MARK: - Visual Components

    let ribbonViewController = RibbonViewController()
    let notificationsViewController = NotificationsViewController()
    let profileViewController = ProfileViewController()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
    }

    // MARK: - Private Methods

    private func createTabBar() {
        let ribbonNavViewController = UINavigationController(rootViewController: ribbonViewController)
        ribbonNavViewController.tabBarItem = UITabBarItem(title: Constants.titleRibbon, image: .home, tag: 0)
        let notificationsNavViewController = UINavigationController(rootViewController: notificationsViewController)
        notificationsNavViewController.tabBarItem = UITabBarItem(
            title: Constants.titleNotification,
            image: .chat,
            tag: 1
        )
        profileViewController.tabBarItem = UITabBarItem(title: Constants.titleProfile, image: .profile, tag: 2)

        setViewControllers(
            [ribbonNavViewController, notificationsNavViewController, profileViewController],
            animated: true
        )
        tabBar.unselectedItemTintColor = .black
    }
}
