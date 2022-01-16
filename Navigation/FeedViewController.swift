//
//  FeedViewController.swift
//  Navigation
//
//  Created by Irina on 14.12.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
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
        
        view.addSubview(stackView)
        addButtonsToStackView()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func addButtonsToStackView() {
        let numberOfButtons = 1...2

        for i in numberOfButtons {
            let button = UIButton()
            button.setTitle("\(i)", for: .normal)
            stackView.addArrangedSubview(button)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 2
            button.layer.cornerRadius = 4
            button.addTarget(self, action: #selector(onOpenPostButtonTap), for: .touchUpInside)
        }
    }
    
//  Will appear Post ViewController and change title of Post VC.
    @objc func onOpenPostButtonTap() {
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
        return config
    }
}
