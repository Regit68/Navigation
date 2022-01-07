//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Irina on 03.01.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let avatarImageView: UIImageView = {
        let image = UIImage(named: "Temple Grandin")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = imageView.frame.height / 5.8
//        image.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Temple Grandin"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
//    private lazy var statusLabel: UILabel = {
//        let status = UILabel()
////        status.text = "Waiting for something..."
//        status.font = UIFont.systemFont(ofSize: 12, weight: .regular)
//        status.textColor = .black
//        status.layer.borderColor = UIColor.black.cgColor
//        status.layer.borderWidth = 1
//        status.layer.cornerRadius = 4
//        status.layer.backgroundColor = UIColor.systemYellow.cgColor
//        return status
//    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
//        label.layer.borderColor = UIColor.black.cgColor
//        label.layer.borderWidth = 1
        label.layer.cornerRadius = 4
//        label.layer.backgroundColor = UIColor.white.cgColor
        return label
    }()
    
//    private lazy var statusTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Waiting for something..."
//        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
//        textField.textColor = .gray
//        textField.layer.borderColor = UIColor.black.cgColor
//        textField.layer.borderWidth = 1
//        textField.layer.cornerRadius = 4
//        textField.layer.backgroundColor = UIColor.white.cgColor
//        textField.addTarget(self, action: #selector(statusTextChanged(_ :)), for: .editingChanged)
//        return textField
//    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor // cgColor for layer.
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.backgroundColor = .systemBlue
        // Instead IBAction.
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpProfileViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpProfileViews()

        // fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonPressed() {
        print("button tapped")
    }
    
////   ( _ textField: UITextField) - RESPONDER
//    @objc private func statusTextChanged(_ textField: UITextField) {
//// Shows the text after filling up text field.
//        statusLabel.text = textField.text
//    }
    
    
//    Redraw
    override func layoutSubviews() {
        avatarImageView.frame = CGRect(x: 16,
                                   y: 16,
                                   width: 115,
                                   height: 115)
        
        nameLabel.sizeToFit() // automatically counts the height
        nameLabel.frame = CGRect(x: 150,
                                 y: 27,
                                 width: self.bounds.width - 83*2,
                                 height: nameLabel.frame.height)
        
//        statusLabel.frame = CGRect(x: 150,
//                                   y: nameLabel.frame.maxY + 20,
//                                   width: self.bounds.width - 83*2,
//                                   height: 20)
        
        statusLabel.frame = CGRect(x: 150,
                                       y: nameLabel.frame.maxY + 44,
                                       width: self.bounds.width - 83*2,
                                       height: 40)
        
        button.frame = CGRect(x: 16,
                              y: statusLabel.frame.maxY + 24,
                              width: self.bounds.width - 16*2,
                              height: 50)
    }
    
    private func setUpProfileViews() {
        self.addSubview(nameLabel)
//        self.addSubview(statusLabel)
        self.addSubview(statusLabel)
        self.addSubview(button)
        self.addSubview(avatarImageView)
    }
    
}
