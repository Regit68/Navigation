//
//  InfoViewController.swift
//  Navigation
//
//  Created by Irina on 23.12.2021.
//

import UIKit

class InfoViewController: UIViewController {

    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    let hiLabel = "Hi, "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemTeal
        createButton()
        setUpButton()
    }
    
    func createButton() {
        button.center = view.center
        button.configuration = .configurateUserNameButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
        // when click button, alert message will appear.
        button.addTarget(self, action: #selector(showsLabelInfo(_:)), for: .touchUpInside)
        // Makes button to appear.
        view.addSubview(button)
    }
    
    // Layout of button.
    func setUpButton() {
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -150).isActive = true
    }
    
    @objc func showsLabelInfo(_ sender: Any) {
        self.alert(title: "Login", message: "Please, enter your name!", style: .alert)
        // Makes label to apear.
        label.center = CGPoint(x: 200, y: 290)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 28)
        label.adjustsFontSizeToFitWidth = true
        // Makes label to appear
        view.addSubview(label)
    }
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            if let textField = alertController.textFields?.first,
               let text = textField.text {
                self.label.text = self.hiLabel + text + "!"
            }
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        alertController.addTextField(configurationHandler: nil)
    }

}

extension UIButton.Configuration {
    static func configurateUserNameButton() -> UIButton.Configuration {
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



