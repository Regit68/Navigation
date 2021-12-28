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
        
        setUpPostView()
        changeTitlePostView()
        openInfoBarButton()
    }
    
    func setUpPostView() {
        view.backgroundColor = .systemGray3
        
        navigationItem.title = "Post"
        
    }
    
    func changeTitlePostView() {
        if let post = post {
            navigationItem.title = post.title
        }
    }
    
    func openInfoBarButton() {
        let rightBarButton = UIBarButtonItem(title: "Info",
                                             style: UIBarButtonItem.Style.plain,
                                             target: self,
                                             action: #selector(self.onOpenInfoBarButtonTap))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    // PRESENT: Info Controller will appear as module.
    @objc func onOpenInfoBarButtonTap() {
        let infoViewController = InfoViewController()
        present(infoViewController,
                animated: true,
                completion: nil)
    }
    
}

struct Post {
    var title: String?
}
