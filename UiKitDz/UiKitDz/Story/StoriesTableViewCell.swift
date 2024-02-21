// StoriesTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка сторис на основном экране
final class StoriesTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let scrollStep = 85
        static let widthStep = 90
    }

    // MARK: - Visual Components

    private let scrollView = UIScrollView()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        actionConstraite()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func setupCell(items: [ScrollStrories]) {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        var startWidth = 0
        var startScroll: CGFloat = 0
        for index in 0 ..< items.count {
            let storyCell = StoriesView(history: items[index])
            scrollView.addSubview(storyCell)
            storyCell.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: startScroll).isActive = true
            storyCell.topAnchor.constraint(equalTo: topAnchor).isActive = true
            storyCell.heightAnchor.constraint(equalToConstant: 75).isActive = true
            storyCell.widthAnchor.constraint(equalToConstant: 85).isActive = true
            startScroll += CGFloat(Constants.scrollStep)
            startWidth += Constants.widthStep
            if index == 0 {
                storyCell.editFirstLabel()
            }
        }
        scrollView.contentSize = CGSize(width: startWidth, height: 100)
    }

    // MARK: - Private Methods

    private func actionConstraite() {
        contentView.addSubview(scrollView)
        contentView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
