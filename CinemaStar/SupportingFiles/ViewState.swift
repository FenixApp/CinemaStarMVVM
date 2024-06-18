// ViewState.swift

import Foundation

/// Состояние загрузки данных
enum ViewState<Model> {
    /// Загрузка данных
    case loading
    /// Данные загружены
    case data(Model)
    /// Данных отсутствуют
    case noData
    /// Ошибка
    case error(_ error: Error)
}
