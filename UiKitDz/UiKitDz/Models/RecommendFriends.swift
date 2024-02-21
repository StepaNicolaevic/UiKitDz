// RecommendFriends.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Рекомендации для пользователя
struct RecomendFriends {
    /// Имя акаунта
    let name: String
    /// Его аватар
    let avatar: String
}

/// Добавление рекомендаций в массив
struct SorseRecomend {
    /// Добавляет пользователя в массив рекомендаций
    static func makeFriends() -> [RecomendFriends] {
        [
            .init(name: "сrimea_082", avatar: "modnic"),
            .init(name: "сrimea_0800", avatar: "modnic"),
            .init(name: "сrimea_08wa2", avatar: "modnic"),
            .init(name: "сrimea_08w2", avatar: "modnic"),
            .init(name: "сrimea_08d2", avatar: "modnic"),
            .init(name: "сrimea_082", avatar: "modnic"),
            .init(name: "сrimea_082", avatar: "modnic")
        ]
    }
}
