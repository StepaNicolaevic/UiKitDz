// PostNotification.swift
// Copyright © RoadMap. All rights reserved.

/// Уведмление о постах
struct PostNotification {
    /// Текст уведомления
    let postText: String
    /// Аватарка человека
    let avatar: String
    /// Изображение о котоpом постопило уведомление
    let postImage: String
    /// функция добавления уведомлений
    static func makePost() -> [PostNotification] {
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
