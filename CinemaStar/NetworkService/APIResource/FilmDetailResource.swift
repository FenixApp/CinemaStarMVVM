// FilmDetailResource.swift

import Foundation

/// Модель запроса для загрузки данных детального описания фильма
struct FilmDetailResource: APIResource {
    /// Тип объекта для декодирования
    typealias ModelType = DetailFilmDTO
    /// Путь
    var methodPath: String
    /// Параметры запроса
    var queryItems: [URLQueryItem]?
}
