// MyMainFeednCell.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Данные поста в инстаграмме
struct MyMainFeednCell {
    /// Имя акаунта человека сделавшего пост
    let nameAccount: String
    /// Его аватар
    let avatarAccount: String
    /// Изображения которые он добавил в пост
    let mainImage: [String]
    /// Подпись его поста
    let commentPage: String
}

/// Добавление постов в массив
struct SorsePosts {
    /// Добавляет пост на главный жкран
    static func makeImage() -> [MyMainFeednCell] {
        [
            .init(
                nameAccount: "StepanNIC",
                avatarAccount: "iam",
                mainImage: ["animal"],

                commentPage: "tur_v_dagestan Насладитесь природы. Забронировать тур в Дагестан можно уже сейчас!"
            ),
            .init(
                nameAccount: "StepanNIC",
                avatarAccount: "iam",
                mainImage: ["animal"],

                commentPage: "tur_v_dagestan Насладитесь природы. Забронировать тур в Дагестан можно уже сейчас!"
            ),
            .init(
                nameAccount: "StepanNIC",
                avatarAccount: "iam",
                mainImage: ["animal"],

                commentPage: "tur_v_dagestan Насладитесь природы. Забронировать тур в Дагестан можно уже сейчас!"
            ),
            .init(
                nameAccount: "StepanNIC",
                avatarAccount: "iam",
                mainImage: ["animal", "ocean", "animal"],

                commentPage: "tur_v_dagestan Насладитесь природы. Забронировать тур в Дагестан можно уже сейчас!"
            )
        ]
    }
}
