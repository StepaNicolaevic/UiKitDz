// Problem1ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Сдесь был блок из за синхронности
class Problem1ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Thread.current)
        let serialQueue = DispatchQueue(label: "com.example.myQueue")

        serialQueue.async {
            print(Thread.current)
            serialQueue.async {
                print("This will never be printed.")
                print(Thread.current)
            }
        }
    }
}
