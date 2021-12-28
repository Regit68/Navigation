//
//  FeedViewController.swift
//  Navigation
//
//  Created by Irina on 14.12.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    var openPostButton: UIButton = {
        let button = UIButton()
        button.configuration = .configurateButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self,
                         action: #selector(onOpenPostButtonTap),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    }
    
// Layout of views.
    func setUpViews() {
        view.backgroundColor = UIColor.systemYellow
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Feed"
        
        view.addSubview(openPostButton)
        
<<<<<<< Updated upstream
    }
    
    func createButton() {
        button.center = view.center
        button.configuration = .freeTrial()
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
=======
        NSLayoutConstraint.activate([
            openPostButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openPostButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            openPostButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -150)
        ])
>>>>>>> Stashed changes
    }
    
//  Will appear Post ViewController and change title of Post VC.
    @objc func onOpenPostButtonTap() {
        let postViewController = PostViewController()
        postViewController.post = Post(title: "New Post")
        self.navigationController?.pushViewController(postViewController,
                                                      animated: true)
    }
    
}

extension UIButton.Configuration {
    static func freeTrial() -> UIButton.Configuration {
        var config: UIButton.Configuration = .filled()
        config.baseBackgroundColor = .systemGray
        config.title = "My Post"
        config.subtitle = "Click to create a new post"
        config.titleAlignment = .center
        config.cornerStyle = .medium
//        config.showsActivityIndicator = true
        return config
    }
}


//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard segue.identifier == "post" else {
//            return
//        }
//        guard let viewController = segue.destination as? PostViewController else {
//            return
//        }
//
//        viewController.post = Post(title: "New Post")
//    }
