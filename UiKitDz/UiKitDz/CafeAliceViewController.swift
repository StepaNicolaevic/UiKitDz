// CafeAliceViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс где выставляется счет
class CafeAliceViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var slayderOne: UISwitch!
    @IBOutlet var slayderTwo: UISwitch!
    @IBOutlet var slayderTheree: UISwitch!

    // MARK: - Public Methods

    @IBAction func vipButton(_ sender: Any) {
        slayderOne.isOn = true
        slayderTwo.isOn = true
        slayderTheree.isOn = true
    }

    @IBAction func billButton(_ sender: UIButton) {
        let bilAlert = UIAlertController(title: "Выставить счет?", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Чек", style: .default) { _ in
            self.performSegue(withIdentifier: "segue", sender: nil)
        }
        bilAlert.addAction(UIAlertAction(title: "Отмена", style: .default))
        bilAlert.addAction(action)
        bilAlert.preferredAction = action
        present(bilAlert, animated: true)
    }
}
