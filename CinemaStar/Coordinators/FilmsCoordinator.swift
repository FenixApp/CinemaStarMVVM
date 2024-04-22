// FilmsCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор основного экрана с подборкой фильмов
final class FilmsCoordinator: BaseCoordinator {
    var rootViewController: UINavigationController?

    override func start() {
        showFilms()
    }

    func showFilms() {
        let filmsViewController = Builder().makeFilmsViewController()
        let rootViewController = UINavigationController(rootViewController: filmsViewController)
        setAsRoot​(​_​: rootViewController)
        self.rootViewController = rootViewController
    }
}
