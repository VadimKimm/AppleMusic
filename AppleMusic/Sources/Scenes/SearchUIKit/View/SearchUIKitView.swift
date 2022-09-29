//
//  SearchUIKitView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 26.09.2022.
//

import UIKit

class SearchUIKitView: UIView {

    // MARK: - Properties

    static let sectionHeaderElementKind = "sectionHeaderElementKind"

    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Strings.searchTextPlaceholder
        return searchController
    }()

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayoutForCollectionView())
        collectionView.register(SearchCollectionViewCell.self,
                                forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        collectionView.register(SearchUIKitHeaderView.self,
                                forSupplementaryViewOfKind: SearchUIKitView.sectionHeaderElementKind,
                                withReuseIdentifier: SearchUIKitHeaderView.identifier)

        collectionView.contentInset.bottom = Metrics.viewBottomOffset
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - Initial

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings

    private func setupHierarchy() {
        addSubview(collectionView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

// MARK: - Layout for collection view

extension SearchUIKitView {
    func createLayoutForCollectionView() -> UICollectionViewLayout {

        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvirnment) -> NSCollectionLayoutSection? in

            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metrics.itemWidth),
                                                  heightDimension: .fractionalHeight(Metrics.itemHeight))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: Metrics.itemDefaultOffset,
                                                         leading: Metrics.itemDefaultOffset,
                                                         bottom: Metrics.itemBottomOffset,
                                                         trailing: Metrics.itemDefaultOffset)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metrics.groupWidth),
                                                   heightDimension: .fractionalWidth(Metrics.groupHeight))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metrics.headerWidth),
                                                    heightDimension: .absolute(Metrics.headerHeight))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                     elementKind: SearchUIKitView.sectionHeaderElementKind,
                                                                     alignment: .top)

            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: Metrics.sectionTopOffset,
                                                            leading: Metrics.sectionSideOffset,
                                                            bottom: .zero,
                                                            trailing: Metrics.sectionSideOffset)
            section.boundarySupplementaryItems = [header]
            return section
        }

        return layout
    }
}

// MARK: - Metrics, Strings

extension SearchUIKitView {
    enum Metrics {
        static let itemWidth: CGFloat = 1/2
        static let itemHeight: CGFloat = 1
        static let itemDefaultOffset: CGFloat = 5
        static let itemBottomOffset: CGFloat = 3

        static let groupWidth: CGFloat = 1
        static let groupHeight: CGFloat = 0.375

        static let headerWidth: CGFloat = 1
        static let headerHeight: CGFloat = 42

        static let sectionTopOffset: CGFloat = 3
        static let sectionSideOffset: CGFloat = 10

        static let viewBottomOffset: CGFloat = 87
    }

    enum Strings {
        static let searchTextPlaceholder = "Ваша медиатека"
    }
}
