// SevenViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// 7 задача
class SevenViewController: UIViewController {
    private lazy var name = "I love RM"
    var lock = NSLock()

    override func viewDidLoad() {
        super.viewDidLoad()

        updateName()
    }

    /// Проблема была в том что мы одновремеено обращаемся к одной переменной а она
    /// со свойством лези и должна инициализироваться 1 раз при первом обращении
    func updateName() {
        DispatchQueue.global().async {
            self.lock.lock()
            print(self.name)
            print(Thread.current)
            self.lock.unlock()
        }

        lock.lock()
        print(name)
        lock.unlock()
    }
}
