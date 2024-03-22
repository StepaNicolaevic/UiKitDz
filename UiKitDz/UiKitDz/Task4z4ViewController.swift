// Task4z4ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class Task4z4ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let threadSafeArray = ThreadSafeArray()
        let operationQueue = OperationQueue()

        let firstOperation = FirstOperation(threadSafeArray: threadSafeArray)
        let secondOperation = SecondOperation(threadSafeArray: threadSafeArray)

        operationQueue.addOperation(firstOperation)
        /// 1 решение
//        operationQueue.waitUntilAllOperationsAreFinished()
        operationQueue.addOperation(secondOperation)

        operationQueue.waitUntilAllOperationsAreFinished()

        print(threadSafeArray.getAll())
    }
}

// Объявляем класс для для синхронизации потоков
class ThreadSafeArray {
    private var array: [String] = []
    /// 2 решение
    let lock = NSLock()
    func append(_ item: String) {
        lock.lock()
        array.append(item)
        lock.unlock()
    }

    func getAll() -> [String] {
        array
    }
}

// Определяем первую операцию для добавления строки в массив
class FirstOperation: Operation {
    let threadSafeArray: ThreadSafeArray

    init(threadSafeArray: ThreadSafeArray) {
        self.threadSafeArray = threadSafeArray
    }

    override func main() {
        if isCancelled { return }
        threadSafeArray.append("Первая операция")
    }
}

// Определяем вторую операцию для добавления строки в массив
class SecondOperation: Operation {
    let threadSafeArray: ThreadSafeArray

    init(threadSafeArray: ThreadSafeArray) {
        self.threadSafeArray = threadSafeArray
    }

    override func main() {
        if isCancelled { return }
        threadSafeArray.append("Вторая операция")
    }
}
