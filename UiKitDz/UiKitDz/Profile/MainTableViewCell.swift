//
//  MainTableViewCell.swift
//  UiKitDz
//
//  Created by Степан Пахолков on 26.02.2024.
//

import UIKit
/// Ячейка с автаркой и именем пользователя
final class MainTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    private enum Constans {
        static let fullNameLabelFont = "Verdana-Bold"
        static let editNameButtonImage = "xmark"
    }
    // MARK: - Visual Components
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let fullName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Constans.fullNameLabelFont, size: 25)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var editNameButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constans.editNameButtonImage), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Public Methods
    // MARK: - Private Methods
    private func addItemCell() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(fullName)
        contentView.addSubview(editNameButton)
    }
    private func setConstraint() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 36)
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
            avatarImageView.heightAnchor.constraint(equalToConstant: <#T##CGFloat#>)
        
        
        ])
    }
    
}
