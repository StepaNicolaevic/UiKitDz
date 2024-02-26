// StackViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Светофор
final class StackViewController: UIViewController {
    // MARK: - Visual Components
    private let redView = CornerView()
    private let yellowView = CornerView()
    private let greenView = CornerView()
    private let grayView = UIView()
    private var stackView = UIStackView()
// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraintStackView()
        setupGrayView()
    }
// MARK: - Private Methods
    private func setupUI() {
        redView.backgroundColor = .red
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        grayView.backgroundColor = .darkGray
        view.addSubview(grayView)
        stackView = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 8
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setConstraintStackView() {
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.heightAnchor.constraint(lessThanOrEqualToConstant: 476).isActive = true
        let heightYellow = stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.37)
        heightYellow.priority = .defaultHigh
        heightYellow.isActive = true
        stackView.widthAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.3).isActive = true
    }

    private func setupGrayView() {
        grayView.translatesAutoresizingMaskIntoConstraints = false
        grayView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: -15).isActive = true
        grayView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -15).isActive = true
        grayView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 15).isActive = true
        grayView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15).isActive = true
    }
}
