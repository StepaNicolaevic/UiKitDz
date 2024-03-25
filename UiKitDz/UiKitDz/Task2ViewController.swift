// Task2ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class Task2ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        print(1)
        Task { /*@MainActor in*/
            print(2)
            print(Thread.current)
        }
        print(3)
    }
}

/// Ничем не отличается и там и там выполнение идет на главном потоке
