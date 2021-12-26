//
//  FeedViewController.swift
//  Navigation
//
//  Created by Irina on 14.12.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemYellow
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Feed"
        
        createButton()
        setUpButton()
        
    }
    
    func createButton() {
        button.center = view.center
        button.configuration = .configurateButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(connectPostViewController), for: .touchUpInside)
        view.addSubview(button)
    }
    
// Layout of button.
    func setUpButton() {
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -150).isActive = true
    }
    
//  Will appear Post ViewController and change title of Post VC.
    @objc func connectPostViewController() {
        let postViewController = PostViewController()
        postViewController.post = Post(title: "New Post")
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
}

extension UIButton.Configuration {
    static func configurateButton() -> UIButton.Configuration {
        var config: UIButton.Configuration = .filled()
        config.baseBackgroundColor = .systemGray
        config.title = "Post"
        config.subtitle = "Click to check a new post"
        config.titleAlignment = .center
        config.cornerStyle = .medium
//        config.showsActivityIndicator = true
        return config
    }
}
