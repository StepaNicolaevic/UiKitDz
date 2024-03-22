// Task3ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///
class Task3ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let service = ArrayAdditionService()
        for i in 1 ... 10 {
            service.addElement(i)
        }
        service.cancelAddition()
    }
}

///
class ArrayAdditionService {
    private var array: [Int] = []
    private var pendingWorkItems: [DispatchWorkItem] = []

    func addElement(_ element: Int) {
        let newWorkItem = DispatchWorkItem { [weak self] in
            self?.array.append(element)
            print("Элемент \(element) успешно добавлен в массив.")
        }

        pendingWorkItems.append(newWorkItem)
        DispatchQueue.main.async(execute: newWorkItem)

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.pendingWorkItems.removeAll()
        }
    }

    func cancelAddition() {
        guard let lastWorkItem = pendingWorkItems.last else {
            print("Нет операций для отмены.")
            return
        }
        lastWorkItem.cancel()
    }
}
