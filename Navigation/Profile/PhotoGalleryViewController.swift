//
//  PhotoGalleryViewController.swift
//  Navigation
//
//  Created by Irina on 23.02.2022.
//

import UIKit

final class PhotoGalleryViewController: UIViewController {
//    var photoGallery: PhotoGalleryModel? {
//        didSet {
//            guard let photo = photoGallery else { return }
//            let photoArray = photo.photos
//
//        }
//    }
            
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        /// Scroll direction is vertical by default.
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
        view.backgroundColor = .systemGray6
        
        setUpPhotoGalleryViewController()
    }
}

extension PhotoGalleryViewController: UICollectionViewDataSource {
// MARK: Create number of sections.
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
// MARK: Amount of items in section.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PublicationStorage.photoGallery.photos.count
    }
// MARK: Creating a cell.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /// Метод dequeue, чтобы не переполнялась память.
        let cell: PhotoCollectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: PhotoCollectionViewCell.self),
            for: indexPath
        ) as! PhotoCollectionViewCell
        
        cell.photoImageView.image = PublicationStorage.photoGallery.photos[indexPath.item]
        
        return cell
    }
}
// MARK: View size for a cell.

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
        return UIEdgeInsets(top: offset, left: offset, bottom: offset, right: offset)
    }
}

private extension PhotoGalleryViewController {
    
    func setUpPhotoGalleryViewController() {
        
        let screenSize: CGFloat = UIScreen.main.bounds.width
        
        [collectionView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension PhotoGalleryViewController: UIScrollViewDelegate {
    //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //        navigationController?.navigationBar.isHidden = true
    //        print(scrollView.contentOffset.y)
    //    }
// MARK: Creating NavigationBar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        navigationController?.navigationBar.isHidden = false
        print(collectionView.contentOffset.y)
        
        navigationItem.title = "Photo Gallery"
        navigationItem.largeTitleDisplayMode = .never
    }
}
