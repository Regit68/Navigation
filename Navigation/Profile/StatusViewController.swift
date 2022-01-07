//
//  StatusViewController.swift
//  Navigation
//
//  Created by Irina on 04.01.2022.
//

import UIKit

protocol StatusViewControllerDelegate: class {
    func changeStatusInProfileVC(_ vc: StatusViewController)
}

class StatusViewController: UIViewController {

    weak var delegate: StatusViewControllerDelegate?
    
    private let profileHeaderView = ProfileHeaderView()
    
    private var setStatusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Set your status..."
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 4
        textField.translatesAutoresizingMaskIntoConstraints = true
        textField.addTarget(self, action: #selector(changeStatusText), for: .editingChanged)
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpStatusViews()
    }

    func setUpStatusViews()  {
        view.backgroundColor = UIColor.white
        
        view.addSubview(setStatusTextField)
        
//        NSLayoutConstraint.activate([
//            setStatusTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            setStatusTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            setStatusTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -150),
//        ])
//
//        setStatusTextField.becomeFirstResponder()
        
        setStatusTextField.frame = CGRect(x: 16,
                                            y: 44,
                                            width: 380,
                                            height: 40)
    }
    
    //   ( _ textField: UITextField) - RESPONDER
        @objc private func changeStatusText() {
            delegate?.changeStatusInProfileVC(self)
            
            // Close StatusVC.
            self.dismiss(animated: true, completion: nil)
    }
    
}
