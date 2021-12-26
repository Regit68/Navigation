//
//  PostViewController.swift
//  Navigation
//
//  Created by Irina on 14.12.2021.
//

import UIKit

class PostViewController: UIViewController {

    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Post"
        view.backgroundColor = .systemGray3
        
        if let post = post {
            navigationItem.title = post.title
        }
        
        setUpBarButton()
    }
    
    func setUpBarButton() {
        let rightBarButton = UIBarButtonItem(title: "Info", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.connectInfotViewController))
                self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    // PRESENT: Info Controller will appear as module.
         @objc func connectInfotViewController() {
            let infoViewController = InfoViewController()
            present(infoViewController, animated: true, completion: nil)
        }
    
}

struct Post {
    var title: String?
}


