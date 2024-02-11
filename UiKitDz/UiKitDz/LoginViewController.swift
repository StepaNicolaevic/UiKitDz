// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// стартовый экран где нужно ввести логин или пароль либо воспользоваться фейс айди
final class LoginViewController: UIViewController {
    // MARK: - Constants

    private let faceIdSwitch = UISwitch()
    private let lineOneView = UIView()
    private let lineTwoView = UIView()

    // MARK: - Visual Components

    private let imageBirrthdayView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Birthday")
        imageView.frame = CGRect(x: 125, y: 70, width: 125, height: 125)
        return imageView
    }()

    private let birthdayReminderLabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday \nReminder"
        label.textColor = .purple
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 100, y: 200, width: 175, height: 44)
        return label
    }()

    private let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in"
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 26)
        label.frame = CGRect(x: 20, y: 266, width: 175, height: 31)
        return label
    }()

    private let emailTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 20, y: 318, width: 175, height: 19)
        return label
    }()

    private let emailTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing email"
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.frame = CGRect(x: 20, y: 347, width: 175, height: 19)
        return textField
    }()

    private let passwordTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 20, y: 393, width: 175, height: 19)
        return label
    }()

    private let passwordTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing password"
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.frame = CGRect(x: 20, y: 422, width: 175, height: 19)
        textField.isSecureTextEntry = true
        return textField
    }()

    private lazy var securityButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.frame = CGRect(x: 332, y: 419, width: 22, height: 19)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(hideText), for: .touchUpInside)
        return button
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
        button.backgroundColor = .red
        button.alpha = 0.3
        button.layer.cornerRadius = 12
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(transitionLogin), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()

    private let swithTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Use FaceID"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 86, y: 544, width: 150, height: 35)
        return label
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addLine()
    }

    // MARK: - Private Methods

    private func setupUI() {
        passwordTextfield.delegate = self
        view.backgroundColor = .white
        view.addSubview(birthdayReminderLabel)
        view.addSubview(passwordTextfield)
        view.addSubview(passwordTitleLabel)
        view.addSubview(signInLabel)
        view.addSubview(emailTextfield)
        view.addSubview(emailTitleLabel)
        view.addSubview(imageBirrthdayView)
        view.addSubview(loginButton)
        view.addSubview(securityButton)
        view.addSubview(faceIdSwitch)
        view.addSubview(swithTitleLabel)
        faceIdSwitch.addTarget(self, action: #selector(useFaceId), for: .valueChanged)
        faceIdSwitch.frame = CGRect(x: 248, y: 544, width: 35, height: 54)
    }

    @objc private func useFaceId(sender: UISwitch) {
        if sender.isOn {
            emailTextfield.text = "pakholkov@yandex.ru"
            passwordTextfield.text = "12345678"
            loginButton.alpha = 1
            loginButton.isEnabled = true
        }
    }

    private func addLine() {
        view.addSubview(lineOneView)
        lineOneView.backgroundColor = .systemGray4
        lineOneView.frame = CGRect(x: 20, y: 372, width: 335, height: 1)
        view.addSubview(lineTwoView)
        lineTwoView.backgroundColor = .systemGray4
        lineTwoView.frame = CGRect(x: 20, y: 448, width: 335, height: 1)
    }

    @objc private func transitionLogin() {
        let transitionVC = BirthdayReminderViewController()
        navigationController?.pushViewController(transitionVC, animated: true)
    }

    @objc private func hideText() {
        if securityButton.currentImage == UIImage(systemName: "eye.slash") {
            securityButton.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordTextfield.isSecureTextEntry = false
        } else {
            securityButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            passwordTextfield.isSecureTextEntry = true
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let loginText = emailTextfield.text ?? ""
        let password = passwordTextfield.text ?? ""
        if loginText.count > 5, password.count > 5 {
            loginButton.alpha = 1
            loginButton.isEnabled = true
        }
        return true
    }
}
