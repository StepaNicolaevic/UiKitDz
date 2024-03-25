// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// class viewcontroller

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        print(1)
        Task {
            print(2)
        }
        print(3)
    }
}

/// Ничего не изменилось операция так и осталась асинхронной
