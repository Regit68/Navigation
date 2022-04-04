//
//  InfoViewController.swift
//  Navigation
//
//  Created by Irina on 23.12.2021.
//

import UIKit

class InfoViewController: UIViewController {

    var alertMessageButton: UIButton = {
        let button = UIButton()
        button.configuration = .configurateAlertMessageButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
        // when button is clicked, alert message will appear.
        button.addTarget(InfoViewController.self, action: #selector(showsLabelInfo(_:)), for: .touchUpInside)
        return button
    }()

    var hiMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 28)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    let hiString = "Hi, "

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpInfoViews()

    }

    func setUpInfoViews() {
        self.view.backgroundColor = UIColor.systemTeal
        // Makes button to appear.
        view.addSubview(alertMessageButton)
        // Makes label to appear
        view.addSubview(hiMessageLabel)

        NSLayoutConstraint.activate([
            alertMessageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertMessageButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertMessageButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -150),
            
            hiMessageLabel.topAnchor.constraint(equalTo: alertMessageButton.topAnchor, constant: -150),
            hiMessageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hiMessageLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0)
        ])

    }

    @objc func showsLabelInfo(_ sender: Any) {
       self.alert(title: "Login", message: "Please, enter your name!", style: .alert)

    }

    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            if let textField = alertController.textFields?.first,
               let text = textField.text {
                self.hiMessageLabel.text = self.hiString + text + "!"
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
        return config
    }
}
