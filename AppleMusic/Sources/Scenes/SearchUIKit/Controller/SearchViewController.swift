//
//  SearchViewController.swift
//  AppleMusic
//
//  Created by Vadim Kim on 26.09.2022.
//

import UIKit
import SwiftUI

class SearchViewController: UIViewController, UICollectionViewDelegate {

    // MARK: - Properties

    private var models = ModelData().searchCategories

    private var searchView:  SearchUIKitView? {
        guard isViewLoaded else { return nil }
        return view as? SearchUIKitView
    }

    // MARK: - Lifecycle

    override func loadView() {
        view = SearchUIKitView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
        setDelegates()
    }

    // MARK: - Settings

    private func setupNavigationController() {
        title = "Поиск"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false

        navigationItem.searchController = searchView?.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    private func setDelegates() {
        searchView?.collectionView.delegate = self
        searchView?.collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier,
                                                            for: indexPath) as? SearchCollectionViewCell
        else {
            return UICollectionViewCell() }

        let model = models[indexPath.row]
        cell.nameLabel.text = model.title
        cell.imageView.image = UIImage(named: "\(model.imageName)")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: SearchUIKitHeaderView.identifier,
                                                                               for: indexPath) as? SearchUIKitHeaderView
        else {
            return UICollectionReusableView()
        }

        return headerView
    }
}
