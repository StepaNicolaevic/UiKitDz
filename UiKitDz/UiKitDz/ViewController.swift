// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// class viewcontroller
actor PhrasesService {
    var phrases: [String] = []

    func addPhrases(_ phrase: String) {
        phrases.append(phrase)
    }
}

///
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let semaphore = DispatchSemaphore(value: 1)

        let phrasesService = PhrasesService()

        DispatchQueue.global().async {
            for i in 0 ..< 10 {
                print(Thread.current)
                semaphore.wait()
                phrasesService.addPhrases("Phrase \(i)")
                semaphore.signal()
            }
        }

        Thread.sleep(forTimeInterval: 1)
        print(Thread.current)
//        print(phrasesService.phrases)
    }
}
