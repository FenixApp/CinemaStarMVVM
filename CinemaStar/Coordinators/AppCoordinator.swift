// AppCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главный координатор
final class AppCoordinator: BaseCoordinator {
    override func start() {
        showFilmsModule()
    }
    
    private func showFilmsModule() {
        let filmsCoordinator = FilmsCoordinator()
        add(coordinator: filmsCoordinator)
        filmsCoordinator.start()
    }
}
