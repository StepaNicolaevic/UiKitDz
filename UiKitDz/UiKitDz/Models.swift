// Models.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Перечисление секций в уведомлениях
enum CellTypeNotifications {
    /// Запросы на добавление
    case request
    /// Уведомления которые пришли сегодня
    case today
    /// Уведомления на этой неделе
    case thisWeak
}

/// Перечисление используеться для структурирования первого экрана
enum CellTypePost {
    /// Скрол вью с горизонтальными ячейками
    case stories
    /// Первая публикация
    case firstPage
    /// Список рекомендованых друзей
    case recomed
    /// Все остальные публикации
    case pages
}

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

/// Данные поста в инстаграмме
struct MyMainRibbonCell {
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
    static func makeImage() -> [MyMainRibbonCell] {
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

/// Уведмление о постах
struct PostComment {
    /// Текст уведомления
    let postText: String
    /// Аватарка человека
    let avatar: String
    /// Изображение о котоком постопило уведомление
    let postImage: String
}

/// Уведомления о подписчиках
struct SubscribeUser {
    /// Текст уведомления
    let postText: String
    /// Аватарка человека
    let avatar: String
}

/// Массив уведолений для 2 секции
struct SourseYourComment {
    /// функция добавления уведомлений
    static func makePost() -> [PostComment] {
        [
            .init(
                postText: "lavanda123 понравился ваш комментарий: Очень красиво! 12ч",
                avatar: "iam",
                postImage: "ocean"
            ),
            .init(
                postText: "lavanda123 упомянул(-а) вас в комментарии: @rm Спасибо! 12ч",
                avatar: "iam",
                postImage: "ocean"

            ),
        ]
    }
}
