// StorySpaceContent.swift
// Copyright © RoadMap. All rights reserved.

/// История о космосе
struct StorySpace {
    /// Название картинки
    let nameImage: String
    /// Подпись картинки
    let nameTitle: String
    /// Добавляет историю в массив
    static func makeStory() -> [StorySpace] {
        [
            .init(nameImage: "start", nameTitle: "Запуск"),
            .init(nameImage: "moon", nameTitle: "Луна"),
            .init(nameImage: "user", nameTitle: "Космонавт"),
            .init(nameImage: "space", nameTitle: "космос"),
            .init(nameImage: "start", nameTitle: "Запуск"),
            .init(nameImage: "moon", nameTitle: "Луна"),
            .init(nameImage: "user", nameTitle: "Космонавт")
        ]
    }
}
