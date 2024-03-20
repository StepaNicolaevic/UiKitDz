// FourViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// 4 задача
class FourViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let thread1 = ThreadprintDemon()
        let thread2 = ThreadprintAngel()
        // Сначала единички
//        thread1.qualityOfService = .userInitiated
//        thread2.qualityOfService = .background
        // Сначала двойки
//        thread1.qualityOfService = .background
//        thread2.qualityOfService = .userInitiated
        // Вперемешку
        thread1.qualityOfService = .userInteractive
        thread2.qualityOfService = .userInitiated

        thread1.start()
        thread2.start()
    }

    class ThreadprintDemon: Thread {
        override func main() {
            for _ in 0 ..< 100 {
                print("1")
            }
        }
    }

    class ThreadprintAngel: Thread {
        override func main() {
            for _ in 0 ..< 100 {
                print("2")
            }
        }
    }
}
