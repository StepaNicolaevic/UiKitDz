// ThreeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// 3 задача
class ThreeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let infinityThread = InfinityLoop()
        print(infinityThread.isExecuting)
        infinityThread.start()

        sleep(2)

        print(infinityThread.isExecuting)
        while infinityThread.isExecuting {
            if infinityThread.counter == 5 {
                infinityThread.cancel()
            }
        }

        print(infinityThread.isFinished)
    }

    class InfinityLoop: Thread {
        var counter = 0

        override func main() {
            while counter < 30, !isCancelled {
                counter += 1
                print(counter)
                InfinityLoop.sleep(forTimeInterval: 1)
            }
        }
    }
}
