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
        // Shows ProfileHeaderView on the ProfileViewController.
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
}
