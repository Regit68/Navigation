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
        let feedUINavigationController = UINavigationController(rootViewController: FeedViewController())
        feedUINavigationController.tabBarItem.image = UIImage(systemName: "house")
        feedUINavigationController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
//        let profileUINavigationController = UINavigationController(rootViewController: ProfileViewController())
//        profileUINavigationController.tabBarItem.image = UIImage(systemName: "person.circle")
//        profileUINavigationController.tabBarItem.selectedImage = UIImage(named: "person.circle.fill")
        
        let logInViewController = UINavigationController(rootViewController: LogInViewController())
        logInViewController.tabBarItem.image = UIImage(systemName: "person.circle")
        logInViewController.tabBarItem.selectedImage = UIImage(named: "person.circle.fill")
        
// An array of the root view controllers displayed by the tab bar interface.
        viewControllers = [feedUINavigationController, logInViewController]
                           //profileUINavigationController]
        
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
