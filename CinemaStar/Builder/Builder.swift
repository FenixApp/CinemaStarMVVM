// Builder.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол для создания модулей
protocol BuilderProtocol {
    func makeFilmsModule(coordinator: FilmsCoordinator) -> FilmsView
}

/// Билдер
final class Builder: BuilderProtocol {
    func makeFilmsModule(coordinator: FilmsCoordinator) -> FilmsView {
        let filmsViewModel = FilmsViewModel(coordinator: coordinator)
        let filmsView = FilmsView()
        filmsView.filmsViewModel = filmsViewModel
        return filmsView
    }
}
