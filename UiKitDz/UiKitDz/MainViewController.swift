// MainViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый вью контроллер с проверкой логина и пароля
final class MainViewController: UIViewController, UITextFieldDelegate {
    // MARK: - IBOutlets

    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var eyeButton: UIButton!
    @IBOutlet var loginButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Public Methods

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let loginText = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if loginText.count > 10, password.count > 5 {
            loginButton.backgroundColor = .systemCyan
            loginButton.layer.cornerRadius = 12
            loginButton.isEnabled = true
        }
        return true
    }

    // MARK: - Private Properties

    private func setupUI() {
        passwordTextField.delegate = self
        passwordTextField.placeholder = "Введите пароль"
        loginTextField.placeholder = "Введите почту"
        loginButton.isEnabled = false
    }

    @IBAction private func textSecurity(_ sender: Any) {
        if eyeButton.currentImage == UIImage(systemName: "eye.slash.fill") {
            eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        } else {
            eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        }
    }
}
