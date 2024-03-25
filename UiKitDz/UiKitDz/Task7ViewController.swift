// Task7ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class Task7ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            await printMessage()
        }
    }

    func printMessage() async {
        let string = await withTaskGroup(of: String.self) { group -> String in
            let messedges = ["Hello", "My", "Road", "Map", "Group"]
            for messedge in messedges {
                group.addTask {
                    messedge
                }
            }

            var collected = [String]()

            for await value in group {
                collected.append(value)
            }

            return collected.joined(separator: " ")
        }

        print(string)
    }
}
