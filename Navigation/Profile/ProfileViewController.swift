//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Irina on 03.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    private let profileHeaderView = ProfileHeaderView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        /// Register a cell. Makes a cell visible.
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: String(describing: PhotoTableViewCell.self))
        /// Register a cell. Makes a cell visible.
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        /// Delete scroll indicator from right side.
        tableView.showsVerticalScrollIndicator = true
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(profileHeaderView)
        
        setUpProfileViewController()
    }
    
    private func setUpProfileViewController() {
        [tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        /// tableView is container for header.
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
// MARK: DataSource
extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
//        guard PublicationStorage.publications.isEmpty else { return 0 }
        return PublicationStorage.publications.count
    }
    /// Number Of Rows In Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return PublicationStorage.publications[section].count
        } else {
            return PublicationStorage.publications[section].count
        }
    }
    /// Shows row at section
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: PhotoTableViewCell.self),
                for: indexPath) as! PhotoTableViewCell
            
            cell.photo = PublicationStorage.publications[indexPath.section][indexPath.row] as? Photo
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: PostTableViewCell.self),
                for: indexPath) as! PostTableViewCell
            
            cell.post = PublicationStorage.publications[indexPath.section][indexPath.row] as? Post
            return cell
        }
    }
    
    // MARK: Header for section.
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        /// Checks for number of section, to make sure this header added to the first one.
        return section == 0 ? profileHeaderView : nil
    }
}

// MARK: Delegate
extension ProfileViewController: UITableViewDelegate {
    /// Cell's height redefinition.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        /// Automatically counts the height of the cell.
        return UITableView.automaticDimension
    }
    /// Переход по ячейке.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /// Shows cell address.
        print("indexPath \(indexPath)")
        /// Will appear PhotoGalleryViewController.
        let photoGalleryVC = PhotoGalleryViewController()
        
        self.navigationController?.pushViewController(photoGalleryVC, animated: true)
        
        /// Cancel gray selection on section.
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
}
/*
 //  Will appear Post ViewController and change title of Post VC.
     @objc func onOpenPostButtonTap() {
         let postViewController = PostViewController()
         postViewController.postModel = PostModel(title: "New Post")
         self.navigationController?.pushViewController(postViewController, animated: true)
     }
 */
