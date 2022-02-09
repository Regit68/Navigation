//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Irina on 03.01.2022.
//

import UIKit

class ProfileViewContoller: UIViewController {
    
    private let posts: [String] = [
        "Books",
        "Movies",
        "Show",
        "Science"
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        /// Register a cell. Makes a cell visible.
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
//        /// Delete scroll indicator from right side.
//        tableView.showsVerticalScrollIndicator = true
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "NEWS"
        view.backgroundColor = .red
        
        setUpProfileViewController()
    }
    
    private func setUpProfileViewController() {
        [tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileViewContoller: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return PublicationStorage.publications.count
    }
    /// Number Of Rows In Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PublicationStorage.publications[section].count
    }
    /// Shows row at section
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as? PostTableViewCell {
            /// Преобразование ячейки. Наполняем ячеку. Обращение к двухмерному массиву.
            cell.post = PublicationStorage.publications[indexPath.section][indexPath.row]
            
            return cell
        }
        
        return UITableViewCell()
    }
// MARK: Header for section.
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let vw = UIView()
//        vw.backgroundColor = UIColor.orange
//        return vw
        let profileHeaderView = ProfileHeaderView()

        return profileHeaderView
    }
}

extension ProfileViewContoller: UITableViewDelegate {
    /// Cell's height redefinition.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        /// Automatically counts the height of the cell.
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        /// Показывает адрес ячейки.
//        print("indexPath \(indexPath)")

        /// Cancel gray selection on section.
        tableView.deselectRow(at: indexPath, animated: true)
    }
}








//class ProfileViewController: UIViewController {
//
//    private let profileHeaderView = ProfileHeaderView()
//
////    lazy var button: UIButton = {
////        let button = UIButton(type: .system)
////        button.translatesAutoresizingMaskIntoConstraints = false
////        button.backgroundColor = .systemOrange
////        button.setTitle("Tap me", for: .normal)
////        button.setTitleColor(.black, for: .normal)
//////        button.layer.cornerRadius = 4
////        return button
////    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setUpProfileView()
//    }
//
//    func setUpProfileView() {
//        view.backgroundColor = UIColor.systemGray6
//
//        navigationController?.navigationBar.prefersLargeTitles = false
//        navigationItem.title = "Profile"
//
//        view.addSubview(profileHeaderView)
////        view.addSubview(button)
//    }
//
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        // Shows ProfileHeaderView on the ProfileViewController.
//        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
//        ])
//
//        //        NSLayoutConstraint.activate([
//        //            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//        //            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//        //            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        //        ])
//    }
//}
//
//
