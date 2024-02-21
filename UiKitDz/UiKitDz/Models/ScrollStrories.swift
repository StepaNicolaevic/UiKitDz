// ScrollStrories.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Данные из сторис
struct ScrollStrories {
    /// Никнейм
    let name: String
    /// Аватар
    let avatar: String
}

/// Добавление людей в сторис
struct SourseTable {
    /// Добавляет человека в массив
    static func makeUsers() -> [ScrollStrories] {
        [
            .init(name: "Ваша история", avatar: "MyAvatar"),
            .init(name: "Степан", avatar: "iam"),
            .init(name: "Степан", avatar: "iam"),
            .init(name: "Степан", avatar: "iam"),
            .init(name: "Степан", avatar: "iam"),
            .init(name: "Степан", avatar: "iam"),
        ]
    }
}
