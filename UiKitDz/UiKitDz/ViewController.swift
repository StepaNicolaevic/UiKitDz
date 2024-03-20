// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// 2 задача
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let timer = TimerThread(duration: 10)
        timer.start()
        timer.updateTimer()
    }
}

/// Timer
class TimerThread: Thread {
    private var timerDuration: Int
    private var timer: Timer!

    init(duration: Int) {
        timerDuration = duration
    }

    override func main() {
        timer = Timer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )

        print(Thread.current)

        RunLoop.main.add(timer, forMode: .default)

        RunLoop.current.run()
    }

    @objc func updateTimer() {
        // Ваш код здесь будет выполняться каждую секунду
        if timerDuration > 0 {
            print("Осталось \(timerDuration) секунд...")
            timerDuration -= 1
        } else {
            print("Время истекло!")

            timer.invalidate()
            // Остановка текущего run loop после завершения таймера
            CFRunLoopStop(CFRunLoopGetCurrent())
        }
    }
}
