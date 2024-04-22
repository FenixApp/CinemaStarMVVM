// FilmsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главный экран приложения
final class FilmsViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    // MARK: - Visual Components

    private let gradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.gradientGray.cgColor, UIColor.gradientGreen.cgColor]
        return layer
    }()

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }

    // MARK: - Public Methods

    private func setupView() {
        view.layer.addSublayer(gradientLayer)
    }

    // MARK: - Private Methods
}
