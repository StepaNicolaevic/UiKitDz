// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Delegate
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        updateScene()
    }

    private func updateScene() {
        let mainViewController = TabBarViewController()
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
    }
}
