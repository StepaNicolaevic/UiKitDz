// PostComment.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Уведмление о постах
struct PostComment {
    /// Текст уведомления
    let postText: String
    /// Аватарка человека
    let avatar: String
    /// Изображение о котоком постопило уведомление
    let postImage: String
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
