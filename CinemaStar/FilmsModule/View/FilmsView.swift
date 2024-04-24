// FilmsView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главный экран приложения
final class FilmsView: UIViewController {
    // MARK: - Types

    var films: [Film] = [
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
        Film(name: "", rating: 2.0, id: 1),
    ]

    // MARK: - Constants

    private enum Constants {
        static let titleText = "Смотри исторические \nфильмы на "
        static let titleLogoText = "CINEMA STAR"
    }

    // MARK: - Visual Components

    private let gradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.gradientGray.cgColor, UIColor.gradientGreen.cgColor]
        return layer
    }()

    private lazy var filmsCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0.5
        layout.itemSize = .init(
            width: Int((UIScreen.main.bounds.width / 2) - 25),
            height: 248
        )
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(
            FilmsViewCell.self,
            forCellWithReuseIdentifier: String(describing: FilmsViewCell.self)
        )
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isUserInteractionEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    private let titleLabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        let attrString = NSMutableAttributedString(
            string: Constants.titleText,
            attributes: [NSAttributedString.Key.font: UIFont.inter(ofSize: 20)]
        )
        let logoAttrString = NSAttributedString(
            string: Constants.titleLogoText,
            attributes: [NSAttributedString.Key.font: UIFont.interBold(ofSize: 20)]
        )
        attrString.append(logoAttrString)
        label.attributedText = attrString
        return label
    }()

    // MARK: - Public Properties

    var filmsViewModel: FilmsViewModelProtocol?

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func configureUI() {
        view.layer.addSublayer(gradientLayer)
        setupTitleLabel()
        setupCollectionView()
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "chevron.backward")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "chevron.backward")
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: nil,
            action: nil
        )
        navigationItem.backBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    private func setupCollectionView() {
        view.addSubview(filmsCollectionView)
        filmsCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14).isActive = true
        filmsCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        filmsCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        filmsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            .isActive = true
    }

    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -74).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

// MARK: - CatalogView + UICollectionViewDelegate

extension FilmsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}

// MARK: - CatalogView + UICollectionViewDataSource

extension FilmsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: FilmsViewCell.self),
            for: indexPath
        ) as? FilmsViewCell else { return UICollectionViewCell() }
        cell.configureCell(info: films[indexPath.item])
        return cell
    }
}
