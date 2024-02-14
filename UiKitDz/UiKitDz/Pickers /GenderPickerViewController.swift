// GenderPickerViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

//// Пикер для выбора пола контакта
final class CustomPicker: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: - Public Properties

    var genderData = ["Male", "Female"]
    var result = ""

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        delegate = self
        dataSource = self
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        delegate = self
        dataSource = self
    }

    // MARK: - Public Methods

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        genderData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        genderData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        result = genderData[row]
    }
}
