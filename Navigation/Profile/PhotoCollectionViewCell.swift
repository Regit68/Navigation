//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Irina on 31.03.2022.
//

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    var photo: Photo? {
        didSet {
            guard let photo = photo else { return }
            photoImageView.image = photo.photo1
            photoImageView.image = photo.photo2
            photoImageView.image = photo.photo3
            photoImageView.image = photo.photo4
        }
    }
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill//.scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemOrange
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
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            photoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8),
            photoImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            photoImageView.widthAnchor.constraint(equalTo: photoImageView.heightAnchor)
        ])
    }
}

