// Task4z3ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class Task4z3ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let rmOperationQueue = RMOperationQueue()

        let rmOperation1 = RMOperation()
        rmOperation1.priority = .background

        rmOperation1.completionBlock = {
            print(1)
        }

        let rmOperation2 = RMOperation()
        rmOperation2.priority = .userInteractive

        rmOperation2.completionBlock = {
            print(2)
        }

        rmOperationQueue.addOperation(rmOperation1)
        rmOperationQueue.addOperation(rmOperation2)
    }
}

protocol RMOperationQueueProtocol {
    var operations: [RMOperation] { get }

    func addOperation(_ operation: RMOperation)

    func executeNextOperation()
}

final class RMOperationQueue: RMOperationQueueProtocol {
    var operations: [RMOperation] = []

    func addOperation(_ operation: RMOperation) {
        operations.append(operation)
        executeNextOperation()
    }

    func executeNextOperation() {
        if let nextOperation = operations.first(where: { !$0.isExecuting && !$0.isFinished }) {
            nextOperation.start()
            executeNextOperation()
        }
    }
}
