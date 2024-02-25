// StoryBordViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Светофор
final class StoryBordViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private var greenView: UIView!
    @IBOutlet private var yellowView: UIView!
    @IBOutlet private var redView: UIView!
// MARK: - Life Cycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        greenView.layer.cornerRadius = greenView.bounds.height / 2
        yellowView.layer.cornerRadius = greenView.bounds.height / 2
        redView.layer.cornerRadius = greenView.bounds.height / 2
    }
}
