//
//  SearchUIKitHeaderView.swift
//  AppleMusic
//
//  Created by Vadim Kim on 28.09.2022.
//

import UIKit

class SearchUIKitHeaderView: UICollectionReusableView {
    
    // MARK: - Properties

    static let identifier = "SearchUIKitHeaderView"

    private lazy var lineSeparator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .systemGray5
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Metrics.labelFontSize, weight: .bold)
        label.text = "Поиск по категориям"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Settings

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    private func setupHierarchy() {
        let subviews = [lineSeparator, label]
        subviews.forEach { addSubview($0) }
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            lineSeparator.topAnchor.constraint(equalTo: topAnchor),
            lineSeparator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.lineSeparatorLeftOffset),
            lineSeparator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Metrics.lineSeparatorRightOffset),
            lineSeparator.heightAnchor.constraint(equalToConstant: Metrics.lineSeparatorHeight),

            label.topAnchor.constraint(equalTo: lineSeparator.bottomAnchor, constant: Metrics.labelTopOffset),
            label.leadingAnchor.constraint(equalTo: lineSeparator.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: lineSeparator.trailingAnchor)
        ])
    }
}

// MARK: - Metrics

extension SearchUIKitHeaderView {
    enum Metrics {
        static let lineSeparatorHeight: CGFloat = 1
        static let lineSeparatorLeftOffset: CGFloat = 5
        static let lineSeparatorRightOffset: CGFloat = -lineSeparatorLeftOffset

        static let labelFontSize: CGFloat = 22
        static let labelTopOffset: CGFloat = 9
    }
}
