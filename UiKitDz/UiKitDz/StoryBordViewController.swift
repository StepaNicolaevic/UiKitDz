// StoryBordViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ghjtjuy
class StoryBordViewController: UIViewController {
    @IBOutlet var greenView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var redView: UIView!

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        greenView.layer.cornerRadius = greenView.bounds.height / 2
        yellowView.layer.cornerRadius = greenView.bounds.height / 2
        redView.layer.cornerRadius = greenView.bounds.height / 2
    }
}
