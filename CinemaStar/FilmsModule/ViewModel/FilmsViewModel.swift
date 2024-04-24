// FilmsViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol FilmsViewModelProtocol {
    init(coordinator: FilmsCoordinator)

//    var updateViewState: ((ViewState<[Film]>) -> ())? { get set }
}

final class FilmsViewModel: FilmsViewModelProtocol {
    private let coordinator: FilmsCoordinator?

    init(coordinator: FilmsCoordinator) {
        self.coordinator = coordinator
    }
}
