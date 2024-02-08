// MainViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// class viewcontroller
class MainViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var eyeButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.placeholder = "Введите пароль"
        loginTextField.placeholder = "Введите почту"
    }

    // MARK: - Public Methods

    @IBAction func textSecurity(_ sender: Any) {
        if eyeButton.currentImage == UIImage(systemName: "eye.slash.fill") {
            eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        } else {
            eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        }
    }
}
