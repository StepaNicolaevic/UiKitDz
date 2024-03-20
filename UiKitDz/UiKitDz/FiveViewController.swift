// FiveViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// 5 Задача
class FiveViewController: UIViewController {
    private var name = "Введите имя"
    private let lockQueue = DispatchQueue(label: "name.lock.queue")

    override func viewDidLoad() {
        super.viewDidLoad()

        updateName()
    }

    func updateName() {
        DispatchQueue.global().async {
            self.lockQueue.async {
                self.name = "I love RM"
                print(Thread.current)
                print(self.name)
            }
        }
        lockQueue.async {
            print(self.name)
        }
    }
}

// В первом случаи поток запускался асинхронно  из за этого так и напечатало
