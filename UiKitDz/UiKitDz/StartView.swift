// StartView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Создание вью для моего основного контроллера
final class StartView: UIView {
    // MARK: - Public Properties

    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Начать", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 16)
        button.titleLabel?.textColor = .white
        button.backgroundColor = UIColor(named: "GreenColor")
        button.layer.cornerRadius = 12
        button.frame = CGRect(x: 20, y: 406, width: 335, height: 44)
        return button
    }()

    let titleWordLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы ввели слово"
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 50, y: 106, width: 275, height: 57)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()

    let wordLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray3
        label.isHidden = true
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.frame = CGRect(x: 50, y: 163, width: 275, height: 57)
        return label
    }()

    let titleResultWordLabel: UILabel = {
        let label = UILabel()
        label.text = "А вот что получиться, если читать справа налево"
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 50, y: 282, width: 275, height: 57)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()

    let resultWordLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 339, width: 275, height: 57)
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.textColor = .systemGray3
        label.isHidden = true
        return label
    }()

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupView() {
        backgroundColor = .white
        addSubview(startButton)
        addSubview(resultWordLabel)
        addSubview(titleWordLabel)
        addSubview(titleResultWordLabel)
        addSubview(wordLabel)
    }
}
