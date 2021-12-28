//
//  InfoViewController.swift
//  Navigation
//
//  Created by Irina on 23.12.2021.
//

import UIKit

class InfoViewController: UIViewController {

<<<<<<< Updated upstream
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
=======
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
>>>>>>> Stashed changes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemTeal
        
        setUpAlertMessageButton()
        setUpHiMessageLabel()
    }
    
<<<<<<< Updated upstream
    func createButton() {
        button.center = view.center
        button.configuration = .enterName()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
        // when click button, alert message will appear.
        button.addTarget(self, action: #selector(showsLabelInfo(_:)), for: .touchUpInside)
=======
    // Layout of button.
    func setUpAlertMessageButton() {
>>>>>>> Stashed changes
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
    
<<<<<<< Updated upstream
    @objc func showsLabelInfo(_ sender: Any) {
        self.alert(title: "Login", message: "Please, enter your name!", style: .alert)
        self.label.text = "Hi, "
        // Makes label to apear.
        label.center = CGPoint(x: 200, y: 290)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 28)
        label.adjustsFontSizeToFitWidth = true
        // Makes label to appear
        view.addSubview(label)
=======
    @objc func showsAlertMessageLabel(_ sender: Any) {
        self.onOpenAlertMessageButtonTap(title: "Login", message: "Please, enter your name!", style: .alert)
>>>>>>> Stashed changes
    }
    
    func onOpenAlertMessageButtonTap(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            if let textField = alertController.textFields?.first,
<<<<<<< Updated upstream
               let text = textField.text,
               let labelText = self.label.text {
                self.label.text = labelText + text + "!"
=======
               let text = textField.text {
                self.openHiMessageLabel.text = self.hiLabel + text + "!"
>>>>>>> Stashed changes
            }
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        alertController.addTextField(configurationHandler: nil)
    }

}

extension UIButton.Configuration {
<<<<<<< Updated upstream
    static func enterName() -> UIButton.Configuration {
=======
    static func configurateAlertMessageButton() -> UIButton.Configuration {
>>>>>>> Stashed changes
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
