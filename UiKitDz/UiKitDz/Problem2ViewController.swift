// Problem2ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Проблема в том что происходит гонка и оба потока пытаюся изменить 1 переменную
class Problem2ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        var sharedResource = 0
        let semafore = DispatchSemaphore(value: 1)
        DispatchQueue.global(qos: .background).async {
            for _ in 1 ... 100 {
                semafore.wait()
                sharedResource += 1
                semafore.signal()
            }
        }

        DispatchQueue.global(qos: .background).async {
            for _ in 1 ... 100 {
                semafore.wait()
                sharedResource += 1
                semafore.signal()
            }
        }
    }
}
