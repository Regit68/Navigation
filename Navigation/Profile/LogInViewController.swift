//
//  LogInViewController.swift
//  Navigation
//
//  Created by Irina on 03.02.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let logoVKWidth: CGFloat = 100
    
    private lazy var logoVK: UIImageView = {
        let image = UIImage(named: "VK")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    lazy var emailPhoneTextField: UIView = {
        let textField = UITextField()
        textField.setLeftPaddingPoints()
        textField.setRightPaddingPoints()
        textField.placeholder = "Email or phone"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.clipsToBounds = true
        textField.textColor = .black
        textField.backgroundColor = .systemGray6
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var passwordTextField: UIView = {
        let textField = UITextField()
        textField.setLeftPaddingPoints()
        textField.setRightPaddingPoints()
        textField.placeholder = "Password"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.clipsToBounds = true
        textField.textColor = .black
        textField.backgroundColor = .systemGray6
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = UIColor(named: "AccentColor")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.addTarget(self, action: #selector(openProfileVC), for: .touchUpInside)
        return button
    }()
    
    // MARK: For scroll view create content view.
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = true
        scrollView.delegate = self
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLogInView()
        
        // MARK: KEYBOARD observers
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        /// Отписываемся от уведомлений о состоянии клавиатуры.
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //  MARK: KEYBOARD actions
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            /// Когда клавиатура появляется, scroll view делает отступ по низу.
            scrollView.contentInset.bottom = keyboardSize.height
            /// Когда клавиатура появляется, verticalScrollIndicatorInsets делает отступ по низу.
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        /// Когда клавиатура скрывается, scroll view делает отступ до 0.
        scrollView.contentInset.bottom = .zero
        /// Когда клавиатура скрывается, verticalScrollIndicatorInsets делает отступ до 0.
        scrollView.verticalScrollIndicatorInsets = .zero
        
    }
    
    func setUpLogInView() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(containerView)
        
        [logoVK,
         emailPhoneTextField,
         passwordTextField,
         logInButton].forEach {
            containerView.addSubview($0)
        }
        
        [logoVK,
         emailPhoneTextField,
         passwordTextField,
         logInButton,
         containerView,
         scrollView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            /// Ограниечение прокручивания по ширине container view.
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoVK.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 120),
            logoVK.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            logoVK.widthAnchor.constraint(equalToConstant: logoVKWidth),
            logoVK.heightAnchor.constraint(equalToConstant: logoVKWidth),
            
            emailPhoneTextField.topAnchor.constraint(equalTo: logoVK.bottomAnchor, constant: 120),
            emailPhoneTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            emailPhoneTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            emailPhoneTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailPhoneTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            /// Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
    }
    
    //  Will appear Profile ViewController.
    @objc func openProfileVC() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
}

extension LogInViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        navigationController?.navigationBar.isHidden = true
        print(scrollView.contentOffset.y)
    }
}
