// FilmResource.swift

import Foundation

/// Модель для запроса данных фильма
struct FilmResource: APIResource {
    /// Тип объекта декодирования
    typealias ModelType = FilmListDTO
    /// Путь
    var methodPath: String
    /// Параметры запроса
    var queryItems: [URLQueryItem]?
}
