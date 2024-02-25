// StackViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Stack
class StackViewController: UIViewController {
    private let redView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    private let grayView = UIView()

    private var stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraintStackView()
        setupGrayView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        greenView.layer.cornerRadius = stackView.bounds.width / 2
        yellowView.layer.cornerRadius = stackView.bounds.width / 2
        redView.layer.cornerRadius = stackView.bounds.width / 2
    }

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
