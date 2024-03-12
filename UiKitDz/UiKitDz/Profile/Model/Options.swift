// Options.swift
// Copyright © RoadMap. All rights reserved.

//
//  Options.swift
//  UiKitDz
//
//  Created by Степан Пахолков on 27.02.2024.
//
/// Название и картинка опции профиля
struct Options {
    let icon: String
    let nameOptions: String

    static func makeOption() -> [Options] {
        [
            .init(icon: "star", nameOptions: "Bonuses"),
            .init(icon: "terms", nameOptions: "Terms & Privacy Policy"),
            .init(icon: "logout", nameOptions: "Log out")
        ]
    }
}
