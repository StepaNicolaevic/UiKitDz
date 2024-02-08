// CafeAliceViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс где выставляется счет
final class CafeAliceViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var slayderOne: UISwitch!
    @IBOutlet private var slayderTwo: UISwitch!
    @IBOutlet private var slayderTheree: UISwitch!

    // MARK: - Public Methods

    @IBAction private func vipButton(_ sender: Any) {
        slayderOne.isOn = true
        slayderTwo.isOn = true
        slayderTheree.isOn = true
    }

    @IBAction private func billButton(_ sender: UIButton) {
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
