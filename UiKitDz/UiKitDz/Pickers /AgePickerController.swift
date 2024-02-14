// AgePickerController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Пикер для выбора возраста контакта
final class AgePickerController: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: - Public Properties

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
        100
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(row)"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        result = String(row)
    }
}
