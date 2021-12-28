//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Irina on 14.12.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpProfileView()
    }
    
    func setUpProfileView() {
        view.backgroundColor = UIColor.systemBrown
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Profile"
    }
    
}
