// SecondViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// 1 задача
class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let thread1 = Thread {
            for _ in 0 ..< 10 {
                let currentThread = Thread.current
                print("1, Current thread: \(currentThread)")
            }
        }
        thread1.start()

        for _ in 0 ..< 10 {
            let currentThread = Thread.current
            print("2, Current thread: \(currentThread)")
        }
    }
}
