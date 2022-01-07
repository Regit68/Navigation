//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Irina on 03.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //    var statusText: String?
    
    private let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpProfileView()
        buttonActionShowsStatus()
    }
    
    func setUpProfileView() {
        view.backgroundColor = UIColor.lightGray
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Profile"
        
        view.addSubview(profileHeaderView)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        profileHeaderView.frame = CGRect(x: 0,
                                         y: 100,
                                         width: view.bounds.width,
                                         height: 300)
    }
    
    func buttonActionShowsStatus() {
        profileHeaderView.button.addTarget(self, action: #selector(openStatusTextField(_:)), for: .touchUpInside)
    }
    
//     PRESENT: Status Controller will appear as module.
    @objc private func openStatusTextField(_ textField: UITextField) {
        let statusViewController = StatusViewController()
        
//        statusViewController.statusText = textField.text!
        statusViewController.delegate = self
        
        present(statusViewController, animated: true, completion: nil)
    }
    
}

extension ProfileViewController: StatusViewControllerDelegate {
    func changeStatusInProfileVC(_ vc: StatusViewController) {
        
    }
}
