// MainViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// class viewcontroller
final class MainViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Калькулятор", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.backgroundColor = UIColor(named: "GreenMainColor")
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor(named: "BorderGreenColor")?.cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(callCalculete), for: .touchUpInside)

        return button
    }()

    private lazy var guessNumberButton: UIButton = {
        let button = UIButton()
        button.setTitle("Угадай число", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(named: "PurpleMainColor")
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor(named: "BorderPurpleColor")?.cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(guessTheNumber), for: .touchUpInside)

        return button
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(named: "SkyblueColor")
        label.font = UIFont(name: "Verdana", size: 30)
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 3
        return label
    }()

    private let backgroundView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Background")
        image.contentMode = .scaleAspectFill
        image.frame = CGRect(x: 0, y: 50, width: 375, height: 775)
        return image
    }()

    // MARK: - Life Cycle

    override func viewDidAppear(_ animated: Bool) {
        welcomeAlert()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    // MARK: - Private Methods

    private func welcomeAlert() {
        let alert = UIAlertController(title: "Пожалуйста, \n представьтесь", message: nil, preferredStyle: .alert)
        let readyAction = UIAlertAction(title: "Готово", style: .default) { _ in
            if let text = alert.textFields?.first {
                self.titleLabel.text = "Приветсвую, \n \(text.text ?? "")!"
                self.titleLabel.isHidden = false
            }
        }
        alert.addTextField { text in
            text.placeholder = "Введите ваше имя"
        }
        alert.addAction(readyAction)
        present(alert, animated: true)
    }

    private func setupUI() {
        view.addSubview(backgroundView)
        view.addSubview(calculateButton)
        view.addSubview(guessNumberButton)
        view.addSubview(titleLabel)
        titleLabel.isHidden = true
        titleLabel.frame = CGRect(x: 0, y: 50, width: 375, height: 82)
        guessNumberButton.frame = CGRect(x: 82, y: 264, width: 150, height: 150)
        calculateButton.frame = CGRect(x: 152, y: 507, width: 200, height: 200)
    }

    @objc private func callCalculete() {
        let alert = UIAlertController(title: "Введите ваши числа", message: nil, preferredStyle: .alert)
        let cancellationAction = UIAlertAction(title: "Отмена", style: .default)
        let sumAction = UIAlertAction(title: "Сложение", style: .default) { _ in
            var sum = 0
            if let textFields = alert.textFields {
                let numberOne = Int(textFields[0].text ?? "")
                let numberTwo = Int(textFields[1].text ?? "")
                sum = (numberOne ?? 0) + (numberTwo ?? 0)
            }
            let resultAlert = UIAlertController(title: "Ваш результат", message: String(sum), preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default)
            let cancellationAction = UIAlertAction(title: "Отмена", style: .default)
            resultAlert.addAction(cancellationAction)
            resultAlert.addAction(okAction)
            self.present(resultAlert, animated: true)
        }

        alert.addTextField { text in
            text.placeholder = "Число 1"
            text.keyboardType = .numberPad
        }

        alert.addTextField { text in
            text.placeholder = "Число 1"
            text.keyboardType = .numberPad
        }

        alert.addAction(sumAction)
        alert.addAction(cancellationAction)
        present(alert, animated: true)
    }

    @objc private func guessTheNumber() {
        let hiddenNumber = 7
        var message = ""
        var titleAlert = ""
        let alertController = UIAlertController(title: "Угадай число от 1 до 10", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            if let textFields = alertController.textFields {
                if Int(textFields.first?.text ?? "") == hiddenNumber {
                    message = "Вы угадали"
                    titleAlert = "Поздравляю"
                } else {
                    message = "Это не верный ответ"
                    titleAlert = "Упс!"
                }
            }
            let resultAlertController = UIAlertController(title: titleAlert, message: message, preferredStyle: .alert)
            resultAlertController.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(resultAlertController, animated: true)
        }
        let cancellationAction = UIAlertAction(title: "Отмена", style: .default)
        alertController.addTextField { textField in
            textField.placeholder = "Введите число"
        }
        alertController.addAction(okAction)
        alertController.addAction(cancellationAction)
        present(alertController, animated: true)
    }
}
