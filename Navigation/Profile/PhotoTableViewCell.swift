//
//  PhotoTableViewCell.swift
//  Navigation
//
//  Created by Irina on 17.02.2022.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
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
        imageView.tintColor = UIColor(named: "AccentColor")
        return imageView
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        stackView.backgroundColor = .systemOrange
        return stackView
    }()
    /// !!! Cannot use instance member 'makeImageView' within property initializer; property initializers run before 'self' is available. USE LAZY VAR instead let.
    lazy var photo1ImageView = makePhotoImageView()
    lazy var photo2ImageView = makePhotoImageView()
    lazy var photo3ImageView = makePhotoImageView()
    lazy var photo4ImageView = makePhotoImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpPhotoTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpPhotoTableViewCell()
    }
    
    private func makePhotoImageView() -> UIImageView {
        let numberOfPhotos = 1...4
        
        for _ in numberOfPhotos {
            let imageView = UIImageView()
            /// Adapts image to postImageView size.
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 6
            imageView.layer.borderColor = UIColor.gray.cgColor
            imageView.layer.borderWidth = 1
            stackView.addArrangedSubview(imageView)
            
            //return imageView
        }
        return imageView!
    }
}

// MARK: Layout
private extension PhotoTableViewCell {
    func setUpPhotoTableViewCell() {
        let allOffsets: CGFloat = 48
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let photoSize: CGFloat = (screenWidth - allOffsets) / 4
        
        [titleLabel,
         arrowButton,
         stackView/*,
         photo1ImageView,
         photo2ImageView,
         photo3ImageView,
         photo4ImageView*/].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            stackView.heightAnchor.constraint(equalToConstant: photoSize),

//            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            
            arrowButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            arrowButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
//            photo1ImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
//            photo1ImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
//            photo1ImageView.widthAnchor.constraint(equalToConstant: photoSize),
//            photo1ImageView.heightAnchor.constraint(equalToConstant: photoSize),
//            photo1ImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
//            photo2ImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
//            photo2ImageView.leadingAnchor.constraint(equalTo: photo1ImageView.trailingAnchor, constant: 8),
//            photo2ImageView.widthAnchor.constraint(equalToConstant: photoSize),
//            photo2ImageView.heightAnchor.constraint(equalToConstant: photoSize),
//            photo2ImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
//
//            photo3ImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
//            photo3ImageView.leadingAnchor.constraint(equalTo: photo2ImageView.trailingAnchor, constant: 8),
//            photo3ImageView.widthAnchor.constraint(equalToConstant: photoSize),
//            photo3ImageView.heightAnchor.constraint(equalToConstant: photoSize),
//            photo3ImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
//
//            photo4ImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
//            photo4ImageView.leadingAnchor.constraint(equalTo: photo3ImageView.trailingAnchor, constant: 8),
//            photo4ImageView.widthAnchor.constraint(equalToConstant: photoSize),
//            photo4ImageView.heightAnchor.constraint(equalToConstant: photoSize),
//            photo4ImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
//            photo4ImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
}
