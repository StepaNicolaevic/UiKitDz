// Task4ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class Task4ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        var result = 0

        Task {
            result = await randomD6()
            print(result)
        }
    }

    func randomD6() async -> Int {
        Int.random(in: 1 ... 6)
    }
}
