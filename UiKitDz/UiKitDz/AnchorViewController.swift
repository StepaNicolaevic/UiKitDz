// AnchorViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
/// Светофор
final class AnchorViewController: UIViewController {
    // MARK: - Visual Components
    private let redView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    private let grayView = UIView()
// MARK: - Life Cycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        greenView.layer.cornerRadius = greenView.bounds.height / 2
        yellowView.layer.cornerRadius = greenView.bounds.height / 2
        redView.layer.cornerRadius = greenView.bounds.height / 2
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupYellowView()
        setupRedView()
        setupGreenView()
        setupGrayView()
    }

// MARK: - Private Methods
    private func setupRedView() {
        view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = .red
        redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        redView.widthAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -8).isActive = true
        redView.topAnchor.constraint(
            greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 40
        ).isActive = true
    }

    private func setupYellowView() {
        view.addSubview(grayView)
        view.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.heightAnchor.constraint(lessThanOrEqualToConstant: 110).isActive = true
        let heightYellow = yellowView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        heightYellow.priority = .defaultHigh
        heightYellow.isActive = true
        yellowView.widthAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
    }

    private func setupGreenView() {
        view.addSubview(greenView)
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.backgroundColor = .green
        greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        greenView.widthAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 8).isActive = true
        greenView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    private func setupGrayView() {
        grayView.translatesAutoresizingMaskIntoConstraints = false
        grayView.backgroundColor = .darkGray
        grayView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -15).isActive = true
        grayView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: -15).isActive = true
        grayView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 15).isActive = true
        grayView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 15).isActive = true
    }
}
