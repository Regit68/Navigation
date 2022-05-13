//
//  PhotoTableViewCell.swift
//  Navigation
//
//  Created by Irina on 17.02.2022.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    var model: PhotoTableViewCellModel? {
        didSet {
            guard let photo = model else { return }
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
        stackView.spacing = 8
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
        let imageView = UIImageView()
        /// Adapts image to postImageView size.
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.borderWidth = 1
        stackView.addArrangedSubview(imageView)
        
        return imageView
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
         stackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            stackView.heightAnchor.constraint(equalToConstant: photoSize),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            
            arrowButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            arrowButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
    }
}
