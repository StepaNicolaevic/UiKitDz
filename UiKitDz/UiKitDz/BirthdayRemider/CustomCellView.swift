// CustomCellView.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Это кастомная ячейка моего вью контроллера
final class CustomCellView: UIView {
    // MARK: - Public Properties

    var nameSurnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Halena Link"
        label.font = .boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 91, y: 25, width: 180, height: 20)
        return label

    }()

    var dateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.text = "10.03 - turns 25!"
        label.font = .systemFont(ofSize: 14)
        label.frame = CGRect(x: 91, y: 53, width: 180, height: 20)
        return label

    }()

    var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Helena")
        image.frame = CGRect(x: 8, y: 11, width: 75, height: 75)
        return image
    }()

    var daysBeforeBirthLabel: UILabel = {
        let label = UILabel()
        label.text = "10 \ndays"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "Purple2")
        label.font = .boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 279, y: 25, width: 42, height: 44)
        return label

    }()

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 20, y: 131, width: 335, height: 93))
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupUI() {
        addSubview(nameSurnameLabel)
        addSubview(dateOfBirthLabel)
        addSubview(daysBeforeBirthLabel)
        addSubview(avatarImageView)
        addSubview(avatarImageView)
    }
}
