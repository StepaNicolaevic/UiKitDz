// Task4z1ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Проблема была в том что класс изначальо не комформит этот протокол а стринг да
class Task4z1ViewController: UIViewController {
    class Post: @unchecked Sendable {}

    enum State1: Sendable {
        case loading
        case data(String)
    }

    enum State2: Sendable {
        case loading
        case data(Post)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
