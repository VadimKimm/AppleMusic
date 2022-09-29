//
//  SearchCollectionViewCell.swift
//  AppleMusic
//
//  Created by Vadim Kim on 26.09.2022.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

    //MARK: - Properties

    static let identifier = "SearchCollectionViewCell"

    // MARK: - Views

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Metric.imageViewCornerRadius
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: Metric.nameLabelFontSize, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Settings

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        let subviews = [imageView, nameLabel]
        subviews.forEach { addSubview($0) }
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),

            nameLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: Metric.nameLabelLeftOffset),
            nameLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: Metric.nameLabelLeftOffset),
            nameLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Metric.nameLabelBottomOffset)
        ])
    }
}


// MARK: - Metrics

extension SearchCollectionViewCell {
    enum Metric {
        static let imageViewCornerRadius: CGFloat = 7
        
        static let nameLabelFontSize: CGFloat = 15
        static let nameLabelLeftOffset: CGFloat = 10
        static let nameLabelRightOffset: CGFloat = -nameLabelLeftOffset
        static let nameLabelBottomOffset: CGFloat = -10
    }
}
