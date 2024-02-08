// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Основной контроллер
final class ViewController: UIViewController {
    // MARK: - Private Properties

    private let startView = StartView()
    private let swapWorld = SwapWord()

    // MARK: - Life Cycle

    override func loadView() {
        view = startView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        triggersButton()
    }

    // MARK: - Private Methods

    private func triggersButton() {
        startView.startButton.addTarget(self, action: #selector(triggersAction), for: .touchUpInside)
    }

    @objc private func triggersAction() {
        let swapAlertController = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        swapAlertController.addAction(UIAlertAction(title: "Отмена", style: .default))
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            if let textFields = swapAlertController.textFields {
                self.startView.wordLabel.text = textFields[0].text
                self.startView.resultWordLabel.text = self.swapWorld.swapWord(textFields.first?.text ?? "")
                self.startView.resultWordLabel.isHidden = false
                self.startView.wordLabel.isHidden = false
                self.startView.titleResultWordLabel.isHidden = false
                self.startView.titleWordLabel.isHidden = false
                self.startView.startButton.frame = CGRect(x: 20, y: 598, width: 335, height: 44)
            }
        }
        swapAlertController.addAction(okAction)
        swapAlertController.addTextField { textField in
            textField.placeholder = "Введите слово"
        }
        present(swapAlertController, animated: true)
    }
}
