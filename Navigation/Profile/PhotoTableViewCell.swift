//
//  PhotoTableViewCellViewController.swift
//  Navigation
//
//  Created by Irina on 17.02.2022.
//

import UIKit

class PhotoTableViewCellViewController: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpPhotoTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpPhotoTableViewCell()
    }
    
    // MARK: Layout
    private extension PhotoTableViewCell {
        func setUpPhotoTableViewCell() {
            [authorLabel,
             postImageView,
             descriptionLabel,
             likesLabel,
             viewsLabel].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                
                contentView.addSubview($0)
            }
}
