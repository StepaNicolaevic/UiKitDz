// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Delegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let profilePresenter = ProfilePresenter()
        let profileView = ProfileViewController()
        profileView.profilePresenter = profilePresenter
        profilePresenter.view = profileView
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = profileView
        window?.makeKeyAndVisible()
    }
}
