// CellTypes.swift
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
