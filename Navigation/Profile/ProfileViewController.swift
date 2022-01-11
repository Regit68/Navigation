//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Irina on 03.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpProfileView()
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
        
//        NSLayoutConstraint.activate([
//            profileHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
//            profileHeaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            profileHeaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            profileHeaderView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            profileHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            profileHeaderView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            profileHeaderView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            profileHeaderView.heightAnchor.constraint(equalTo: view.heightAnchor)
//        ])
        
    }
}
