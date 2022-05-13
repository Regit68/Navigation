//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Irina on 31.03.2022.
//

import UIKit
// MARK: Information about one cell.
final class PhotoCollectionViewCell: UICollectionViewCell {
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemGray6
        
        setUpPhotoCollectionViewCell()
    }
    /// For work with storyboards and XIB files.
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension PhotoCollectionViewCell {
    func setUpPhotoCollectionViewCell() {
        
        [photoImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            photoImageView.widthAnchor.constraint(equalTo: photoImageView.heightAnchor)
        ])
    }
}
