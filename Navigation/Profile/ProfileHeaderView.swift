//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Irina on 03.01.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String?
    private let avatarWidth: CGFloat = 120
    
    private lazy var avatarImageView: UIImageView = {
        let image = UIImage(named: "Temple Grandin")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = avatarWidth / 2
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Temple Grandin"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        textField.placeholder = "Enter status"
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
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.shadowColor = UIColor.black.cgColor     // cgColor for layer.
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
        
    }
    
    @objc private func buttonPressed() {
        statusLabel.text = (statusText ?? "").isEmpty ? "Waiting for something..." : statusText
    }
    
    //  ( _ textField: UITextField) - RESPONDER
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
    
    private func setUpProfileViews() {
        [avatarImageView,
         nameLabel,
         statusLabel,
         statusTextField,
         button].forEach {
            // Enables autolayout for our imageView.
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: avatarWidth),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarWidth),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            nameLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 160),
            nameLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -180),
            
            statusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 155),
            statusLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 160),
            statusLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -180),
            statusLabel.heightAnchor.constraint(equalTo: heightAnchor, constant: -865),
            
            statusTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            statusTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 160),
            statusTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -180),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            button.topAnchor.constraint(equalTo: topAnchor, constant: 250),
            button.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            button.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -35),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
// Makes left and right padding inside UITextField.
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
