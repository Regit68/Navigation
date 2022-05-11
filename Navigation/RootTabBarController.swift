//
//  ViewController.swift
//  Navigation
//
//  Created by Irina on 11.12.2021.
//

import UIKit

class RootTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabBar()
        updateTabBarAppearance()
    }
    func setUpTabBar() {
        // An array of the root view controllers displayed by the tab bar interface.
        viewControllers = [
            createController(for: FeedViewController(),
                             title: "Feed",
                             image: UIImage(systemName: "house"),
                             selectedImage: UIImage(systemName: "house.fill")),
            createController(for: LogInViewController(),
                             title: "Profile",
                             image: UIImage(systemName: "person.circle"),
                             selectedImage: UIImage(systemName: "person.circle.fill"))
        ]
        self.tabBar.tintColor = UIColor.purple
    }
    
    private func createController(for rootViewController: UIViewController,
                                  title: String,
                                  image: UIImage?,
                                  selectedImage: UIImage?) -> UIViewController {
        let nc = UINavigationController(rootViewController: rootViewController)
        nc.tabBarItem .title = title
        nc.tabBarItem .image = image
        nc.tabBarItem .selectedImage = selectedImage
        
        return nc
    }
    
    // Adds Tab Bar.
    @available(iOS 15.0, *)
    private func updateTabBarAppearance() {
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()

        let barTintColor: UIColor = .systemFill
        tabBarAppearance.backgroundColor = barTintColor

        self.tabBar.standardAppearance = tabBarAppearance
        self.tabBar.scrollEdgeAppearance = tabBarAppearance
    }
}
