// ContactPeopleViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Добавление нового контакта в мои список контактов
final class ContactPeopleViewController: UIViewController {

    // MARK: - Visual Components
    private let datePicker = UIDatePicker()
    private let genderPicker = CustomPicker()
    private let agePicker = AgePickerController()
    private let toolbar = UIToolbar()
    private let toolbar2 = UIToolbar()
    private let toolbar3 = UIToolbar()
    private let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)


    private let fullnamelTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Surname"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 20, y: 239, width: 175, height: 19)
        return label
    }()

    private let fullnameTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing Name Surname"
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.frame = CGRect(x: 20, y: 268, width: 250, height: 17)
        return textField
    }()

    private let bithdayTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bithday"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 20, y: 314, width: 175, height: 19)
        return label
    }()

    private let bithdayTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing Date of Birth"
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.frame = CGRect(x: 20, y: 343, width: 250, height: 17)
        return textField
    }()

    private let agelTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 20, y: 389, width: 175, height: 19)
        return label
    }()

    private let ageTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing age"
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.frame = CGRect(x: 20, y: 418, width: 250, height: 17)
        return textField
    }()

    private let genderTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 20, y: 462, width: 175, height: 19)
        return label
    }()

    private let genderTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Indicate Gender"
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.frame = CGRect(x: 20, y: 491, width: 250, height: 17)
        return textField
    }()

    private let telegramTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Telegram"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 20, y: 537, width: 175, height: 19)
        return label
    }()

    private lazy var telegramTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing Telegram"
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.frame = CGRect(x: 20, y: 566, width: 250, height: 17)
        textField.addTarget(self, action: #selector(setTelegram), for: .allEvents)
        return textField
    }()

    private var newFotoView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Foto")
        image.frame = CGRect(x: 125, y: 66, width: 125, height: 125)
        return image
    }()

    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 15, width: 50, height: 20)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 325, y: 15, width: 30, height: 20)
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(addMyFriend), for: .touchUpInside)
        return button
    }()

    private var changePhotoButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 125, y: 199, width: 125, height: 30)
        button.setTitle("Change photo", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    private let lineOneView = UIView()
    private let lineTwoView = UIView()
    private let lineThreeView = UIView()
    private let lineFourView = UIView()
    private let lineFiveView = UIView()

    // MARK: - Public Properties

    weak var delegate: PeopleDelegate?
    private var trasitionDate = String()
    // MARK: - Life Cycle

    private lazy var doneButton = UIBarButtonItem(
        title: "Done",
        style: .done,
        target: self,
        action: #selector(datePickerValueChanged)
    )
    private lazy var comformGenderButton = UIBarButtonItem(
        title: "OK",
        style: .done,
        target: self,
        action: #selector(genderPickerValueChanged)
    )
    private lazy var comformAgeButton = UIBarButtonItem(
        title: "OK",
        style: .done,
        target: self,
        action: #selector(agePickerValueChanged)
    )


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addLine()
        setPickerButton()
    }

    // MARK: - Private Methods

    private func addLine() {
        view.addSubview(lineOneView)
        lineOneView.backgroundColor = .systemGray4
        lineOneView.frame = CGRect(x: 20, y: 293, width: 335, height: 1)
        view.addSubview(lineTwoView)
        lineTwoView.backgroundColor = .systemGray4
        lineTwoView.frame = CGRect(x: 20, y: 368, width: 335, height: 1)
        view.addSubview(lineThreeView)
        lineThreeView.backgroundColor = .systemGray4
        lineThreeView.frame = CGRect(x: 20, y: 443, width: 335, height: 1)
        view.addSubview(lineFourView)
        lineFourView.backgroundColor = .systemGray4
        lineFourView.frame = CGRect(x: 20, y: 516, width: 335, height: 1)
        view.addSubview(lineFiveView)
        lineFiveView.backgroundColor = .systemGray4
        lineFiveView.frame = CGRect(x: 20, y: 591, width: 335, height: 1)
    }

    private func setupUI() {
        [
            telegramTextfield,
            telegramTitleLabel,
            genderTextfield,
            genderTitleLabel,
            ageTextfield,
            agelTitleLabel,
            bithdayTextfield,
            bithdayTitleLabel,
            fullnameTextfield,
            fullnamelTitleLabel,
            addButton,
            cancelButton,
            changePhotoButton,
            newFotoView
        ].forEach { view.addSubview($0) }
        view.backgroundColor = .white
    }

    private func setPickerButton() {
        toolbar2.sizeToFit()
        toolbar2.setItems([flexSpace, doneButton], animated: true)
        bithdayTextfield.inputView = datePicker
        bithdayTextfield.inputAccessoryView = toolbar2
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels

        toolbar.sizeToFit()
        genderTextfield.inputView = genderPicker
        toolbar.setItems([flexSpace, comformGenderButton], animated: true)
        genderTextfield.inputAccessoryView = toolbar

        toolbar3.sizeToFit()
        ageTextfield.inputView = agePicker
        toolbar3.setItems([flexSpace, comformAgeButton], animated: true)
        ageTextfield.inputAccessoryView = toolbar3
    }

    @objc private func addMyFriend() {
        let person = People(
            nameSurname: fullnameTextfield.text ?? "",
            avatarImage: "Foto",
            daysbBeforeBirthday: "144",
            dayBirthday: trasitionDate,
            age: ageTextfield.text ?? ""
        )
        delegate?.transferPeople(model: person)
    }

    @objc private func setTelegram() {
        let alertController = UIAlertController(title: "Please enter Telegram", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            if let textField = alertController.textFields?[0] {
                self.telegramTextfield.text = textField.text
            }
        }
        alertController.addTextField { textField in
            textField.placeholder = "Typing Telegram"
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default))
        alertController.addAction(okAction)
        alertController.preferredAction = okAction
        present(alertController, animated: true)
    }

    @objc private func datePickerValueChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY"
        let trasitionFormater = DateFormatter()
        trasitionFormater.dateFormat = "dd.MM"
        trasitionDate = trasitionFormater.string(from: datePicker.date)
        bithdayTextfield.text = dateFormatter.string(from: datePicker.date)
        bithdayTextfield.resignFirstResponder()
    }

    @objc private func genderPickerValueChanged() {
        genderTextfield.text = genderPicker.result
        genderTextfield.resignFirstResponder()
    }

    @objc private func agePickerValueChanged() {
        ageTextfield.text = agePicker.result
        ageTextfield.resignFirstResponder()
    }

    @objc private func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
