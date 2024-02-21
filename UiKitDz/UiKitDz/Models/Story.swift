// Story.swift
// Copyright © RoadMap. All rights reserved.

/// Данные из сторис
struct Story {
    /// Никнейм
    let name: String
    /// Аватар
    let avatar: String
    /// Добавляет человека в массив
    static func makeUsers() -> [Story] {
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
