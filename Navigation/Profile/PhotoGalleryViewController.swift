//
//  PhotoGalleryViewController.swift
//  Navigation
//
//  Created by Irina on 23.02.2022.
//

import UIKit

enum PhotoSection: Int, CaseIterable {
    case photos = 0
}

final class PhotoGalleryViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        // Scroll direction is vertical by default.
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(
            PhotoCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PhotoCollectionViewCell.self)
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpPhotoGalleryViewController()
    }
}

extension PhotoGalleryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 //PublicationStorage.publications[0].count
    }
    /// Creating a cell.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /// Метод dequeue, чтобы не переполнялась память.
        let cell: PhotoCollectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: PhotoCollectionViewCell.self),
            for: indexPath
        ) as! PhotoCollectionViewCell
        
//        cell.photo = PublicationStorage.publications[indexPath.section][indexPath.item]
        
//        cell.backgroundColor = .red
        
        return cell
    }
}
/// View size for a cell.
/// UICollectionViewDelegateFlowLayout - более разширенный делегат.
extension PhotoGalleryViewController: UICollectionViewDelegateFlowLayout {
    var offset: CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width - offset * 4) / 3
        
        return CGSize.init(width: width, height: width)
    }
    
    /// Space between items. Vertical.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return offset
    }
    /// Space between sections. Horizontal.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return offset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: .zero, left: offset, bottom: offset, right: offset)
    }
}

private extension PhotoGalleryViewController {
    
    func setUpPhotoGalleryViewController() {
//        view.backgroundColor = .white
        navigationItem.title = "Photo Gallery"
        navigationItem.largeTitleDisplayMode = .never
        
        [collectionView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
