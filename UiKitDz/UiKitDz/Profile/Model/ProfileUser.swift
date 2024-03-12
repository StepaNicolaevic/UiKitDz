// ProfileUser.swift
// Copyright © RoadMap. All rights reserved.

//
//  ProfileUser.swift
//  UiKitDz
//
//  Created by Степан Пахолков on 27.02.2024.
//
/// Профиль пользователя
struct ProfileUser {
    let name: String
    let surName: String
    let avatarImage: String
    static func makeProfile() -> ProfileUser {
        .init(name: "Name", surName: "Surname", avatarImage: "avatar")
    }
}
