//
//  InfoViewController.swift
//  Navigation
//
//  Created by Irina on 23.12.2021.
//

import UIKit

class InfoViewController: UIViewController {

    var openAlertMessageButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.configuration = .configurateAlertMessageButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
        // After tap button, alert message will appear.
        button.addTarget(self,
                         action: #selector(showsAlertMessageLabel(_:)),
                         for: .touchUpInside)
        return button
    }()
    
    var openHiMessageLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.center = CGPoint(x: 200, y: 290)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 28)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let hiLabel = "Hi, "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemTeal
        
        setUpAlertMessageButton()
        setUpHiMessageLabel()
    }
    // Layout of button.
    func setUpAlertMessageButton() {
        // Makes button to appear.
        view.addSubview(openAlertMessageButton)
        
        NSLayoutConstraint.activate([
            openAlertMessageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openAlertMessageButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            openAlertMessageButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -150)
        ])
    }
    
    func setUpHiMessageLabel() {
        // Makes label to appear
        view.addSubview(openHiMessageLabel)
    }
    
    @objc func showsAlertMessageLabel(_ sender: Any) {
        self.onOpenAlertMessageButtonTap(title: "Login", message: "Please, enter your name!", style: .alert)
    }
    
    func onOpenAlertMessageButtonTap(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            if let textField = alertController.textFields?.first,
               let text = textField.text {
                self.openHiMessageLabel.text = self.hiLabel + text + "!"
            }
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        alertController.addTextField(configurationHandler: nil)
    }

}

extension UIButton.Configuration {
    static func configurateAlertMessageButton() -> UIButton.Configuration {
        var config: UIButton.Configuration = .filled()
        config.baseBackgroundColor = .systemGray
        config.title = "Enter Data"
        config.subtitle = "Click to enter your data"
        config.titleAlignment = .center
        config.cornerStyle = .medium
//        config.showsActivityIndicator = true
        return config
    }
}
