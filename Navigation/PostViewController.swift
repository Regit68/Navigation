//
//  PostViewController.swift
//  Navigation
//
//  Created by Irina on 14.12.2021.
//

import UIKit

class PostViewController: UIViewController {
    
    var postModel: PostModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpPostView()
        renamePostViewTitle()
        setUpInfoBarButton()
        
    }
    
    func setUpPostView() {
        view.backgroundColor = .systemGreen
        navigationItem.title = "Post"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    func renamePostViewTitle() {
        if let post = postModel {
            navigationItem.title = post.title
        }
    }
    
    func setUpInfoBarButton() {
        let rightBarButton = UIBarButtonItem(
            image: UIImage(systemName: "info.circle"),
            style: UIBarButtonItem.Style.plain,
            target: self,
            action: #selector(self.onInfoBarButtonTap)
        )
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    // PRESENT: Info Controller will appear as module.
    @objc func onInfoBarButtonTap() {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true, completion: nil)
    }
    
}

struct PostModel {
    var title: String?
}
