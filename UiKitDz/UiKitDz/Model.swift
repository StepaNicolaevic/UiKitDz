// Model.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Эта модель используется для переворота текста
struct SwapWord {
    // MARK: - Public Methods

    func swapWord(_ word: String) -> String {
        String(word.reversed())
    }
}
