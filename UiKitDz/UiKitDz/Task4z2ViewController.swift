// Task4z2ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol RMOperationProtocol {
    var priority: DispatchQoS.QoSClass { get }
    var completionBlock: (() -> Void)? { get }
    var isFinished: Bool { get }
    var isExecuting: Bool { get }
    func start()
}

class RMOperation: RMOperationProtocol {
    var isExecuting: Bool = false

    var priority: DispatchQoS.QoSClass = .userInteractive

    var completionBlock: (() -> Void)?

    var isFinished: Bool = false

    func start() {
        completionBlock!()
        isFinished = true
    }
}

class Task4z2ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let operationFirst = Operation()
        let operationSecond = Operation()

        operationFirst.qualityOfService = .userInteractive
        operationFirst.completionBlock = {
            for _ in 0 ..< 50 {
                print(2)
            }
            print(Thread.current)
            print("Операция полностью завершена!")
            operationSecond.start()
        }

        operationFirst.start()

        operationSecond.qualityOfService = .background
        operationSecond.completionBlock = {
            for _ in 0 ..< 50 {
                print(1)
            }
            print(Thread.current)
            print("Операция полностью завершена!")
        }
    }
}
