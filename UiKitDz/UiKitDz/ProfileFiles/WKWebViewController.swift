// WKWebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Веб сайт spaceX
final class WKWebViewController: UIViewController {
    // MARK: - Private properties

    private let webView = WKWebView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewController()
    }

    // MARK: - Private Methods

    private func loadViewController() {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false

        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loadRequest()
    }

    private func loadRequest() {
        guard let url = URL(string: "https://www.spacex.com/vehicles/starship/") else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
}
