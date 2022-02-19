//
//  PhotoTableViewCell.swift
//  Navigation
//
//  Created by Irina on 17.02.2022.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
//    var offset: CGFloat {
//        return 12
//    }
    
//    let photoSize: CGFloat = width = height = (screen width - offset) / 4
    
    var photo: Photo? {
        didSet {
            guard let photo = photo else { return }
            titleLabel.text = photo.title
            arrowButton.image = photo.arrowButton
            photo1ImageView.image = photo.photo1
            photo2ImageView.image = photo.photo2
            photo3ImageView.image = photo.photo3
            photo4ImageView.image = photo.photo4
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private let arrowButton: UIImageView = {
        let imageView = UIImageView()
        /// Adapts image to postImageView size.
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let photo1ImageView: UIImageView = {
        let imageView = UIImageView()
        /// Adapts image to postImageView size.
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    private let photo2ImageView: UIImageView = {
        let imageView = UIImageView()
        /// Adapts image to postImageView size.
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    private let photo3ImageView: UIImageView = {
        let imageView = UIImageView()
        /// Adapts image to postImageView size.
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    private let photo4ImageView: UIImageView = {
        let imageView = UIImageView()
        /// Adapts image to postImageView size.
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpPhotoTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpPhotoTableViewCell()
    }
}

// MARK: Layout
private extension PhotoTableViewCell {
    func setUpPhotoTableViewCell() {
        [titleLabel,
         arrowButton,
         photo1ImageView,
         photo2ImageView,
         photo3ImageView,
         photo4ImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
//            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
//            arrowButton.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
            arrowButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            photo1ImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            photo1ImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photo1ImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            photo1ImageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            photo2ImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            photo2ImageView.leadingAnchor.constraint(equalTo: photo1ImageView.trailingAnchor, constant: 8),
            photo2ImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            photo2ImageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            photo3ImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            photo3ImageView.leadingAnchor.constraint(equalTo: photo2ImageView.trailingAnchor, constant: 8),
            photo3ImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            photo3ImageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            photo4ImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            photo4ImageView.leadingAnchor.constraint(equalTo: photo3ImageView.trailingAnchor, constant: 8),
            photo4ImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            photo4ImageView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}

// MARK: image (Ширнину / 4 - отступы).
// StackView
