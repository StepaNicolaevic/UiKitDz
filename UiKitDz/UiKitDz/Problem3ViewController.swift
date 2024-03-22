// Problem3ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///
class Problem3ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        var people1 = People1()
        var people2 = People2()

        let thread1 = Thread {
            people1.walkPast(with: people2)
        }

        thread1.start()

        let thread2 = Thread {
            people2.walkPast(with: people1)
        }

        thread2.start()
    }
}

///
class People1 {
    var isDifferentDirections = false

    var semafor = DispatchSemaphore(value: 1)

    func walkPast(with people: People2) {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.sync {
                while !people.isDifferentDirections {
                    print("People1 не может обойти People2")
                    sleep(1)
                }
            }
        }
        DispatchQueue.global(qos: .userInteractive).async {
            DispatchQueue.main.sync {
                self.semafor.wait()

                print("People1 смог пройти прямо")
                self.isDifferentDirections = true
                self.semafor.signal()
            }
        }
    }
}

///
class People2 {
    var isDifferentDirections = false
    var semafor = DispatchSemaphore(value: 1)

    func walkPast(with people: People1) {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.sync {
                while !people.isDifferentDirections {
                    print("People1 не может обойти People2")
                    sleep(1)
                }
            }
        }
        DispatchQueue.global(qos: .userInteractive).async {
            DispatchQueue.main.sync {
                self.semafor.wait()

                print("People1 смог пройти прямо")
                self.isDifferentDirections = true
                self.semafor.signal()
            }
        }
    }
}
