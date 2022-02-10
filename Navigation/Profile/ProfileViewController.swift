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

extension ProfileViewController: UITableViewDataSource {
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
        /// Checks for number of section, to make sure this header added to the first one.
        return section == 0 ? profileHeaderView : nil
    }
}

extension ProfileViewController: UITableViewDelegate {
    /// Cell's height redefinition.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        /// Automatically counts the height of the cell.
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /// Показывает адрес ячейки.
        print("indexPath \(indexPath)")
        
        /// Cancel gray selection on section.
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
}
