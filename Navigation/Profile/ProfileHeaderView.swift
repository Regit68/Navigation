//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Irina on 03.01.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String?
    
    private let avatarImageView: UIImageView = {
        let image = UIImage(named: "Temple Grandin")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = imageView.frame.size.width/5.8
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Temple Grandin"
//        label.layer.borderColor = UIColor.gray.cgColor
//        label.layer.borderWidth = 1
//        label.layer.cornerRadius = 4
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
//    lazy var statusLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Waiting for something..."
//        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
//        label.textColor = .darkGray
//        label.layer.borderColor = UIColor.gray.cgColor
//        label.layer.borderWidth = 1
//        label.layer.cornerRadius = 4
////        label.layer.backgroundColor = UIColor.white.cgColor
//        return label
//    }()
    
    private lazy var statusTitleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Waiting for something..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.textColor = .gray
//        textField.layer.borderColor = UIColor.black.cgColor
//        textField.layer.borderWidth = 1
//        textField.layer.cornerRadius = 4
//        textField.layer.backgroundColor = UIColor.white.cgColor
//        textField.addTarget(self, action: #selector(statusTextChanged(_ :)), for: .editingChanged)
        return textField
    }()
    
    lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Waiting for something..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.addTarget(self, action: #selector(statusTextChanged(_ :)), for: .editingChanged)
        return textField
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
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
    // Calling for storyboards.
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpProfileViews()

        // fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonPressed() {
        print(statusTitleTextField.text ?? "Waiting for something...")
    }
    
    
    //  ( _ textField: UITextField) - RESPONDER
    @objc private func statusTextChanged(_ textField: UITextField) {
        // Shows the text after filling up text field.
        statusText = textField.text
        statusTitleTextField.text = statusText
    }
    
    private func setUpProfileViews() {
        self.addSubview(avatarImageView)
        self.addSubview(nameLabel)
//        self.addSubview(statusLabel)
        self.addSubview(statusTitleTextField)
        self.addSubview(statusTextField)
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 115),
            avatarImageView.heightAnchor.constraint(equalToConstant: 115),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            nameLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 160),
            nameLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -180),
            
            statusTitleTextField.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            statusTitleTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 160),
            statusTitleTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -180),
            statusTitleTextField.heightAnchor.constraint(equalTo: heightAnchor, constant: -265),
            
            statusTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            statusTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 160),
            statusTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -180),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            button.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            button.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            button.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -35),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
