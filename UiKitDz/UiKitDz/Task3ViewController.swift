// Task3ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class Task3ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Task 1 is finished")

        Task.detached(priority: .userInitiated) {
            for i in 0 ..< 50 {
                print(i)
            }
            print("Task 2 is finished")
            print(Thread.current)
        }

        print("Task 3 is finished")
    }
}

/// При изменении на таск ничего не поменялось
/// При установки приоритета тоже так другие операции  выполняются в паралельно
