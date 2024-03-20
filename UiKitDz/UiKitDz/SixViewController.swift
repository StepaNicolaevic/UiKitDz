// SixViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// 6 Задача
class SixViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        print("A")

        DispatchQueue.main.async {
            print("B")
        }

        print("C")
    }
}
