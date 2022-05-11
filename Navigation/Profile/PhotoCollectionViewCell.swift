//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Irina on 31.03.2022.
//

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    var photoGalary: PhotoGalleryModel? {
//    var photo: PhotoTableViewCellModel? {
        didSet {
            guard let photo = photoGalary else { return }
            photoImageView.image = photo.photos[1]
//            photoImageView.image = photo.photo1
//            photoImageView.image = photo.photo2
//            photoImageView.image = photo.photo3
//            photoImageView.image = photo.photo4
        }
    }
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit//.scaleAspectFill//
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemGreen
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

