// CornerView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс чтобы вью была круглая
class CornerView: UIView {
    // MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
}
