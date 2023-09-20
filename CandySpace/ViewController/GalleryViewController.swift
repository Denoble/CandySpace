//
//  GalleryViewController.swift
//  CandySpace
//
//  Created by Lawrence on 9/19/23.
//

import UIKit

class GalleryViewController: UIViewController {
    @IBOutlet weak var photoCollectionView: UICollectionView!
    private let galleryViewModel = GalleryViewModel(networkManager: NetworkManager())
    private let itemsPerRow: CGFloat = 4
    var query: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        styleSetting()
        // navigation title
        guard let query = query else { return }
        if query.isEmpty {
            navigationItem.title = "Gallery"
        } else {
            navigationItem.title = "Gallery for '\(query)'"
        }
        // photo collection data source delegate
        photoCollectionView.dataSource = self
        Task {
            await self.galleryViewModel.getImageGallery(searchTerm: query)
            DispatchQueue.main.async {
                self.photoCollectionView.reloadData()
            }
        }
    }
    func styleSetting() {
        // background image setting
        let imageView: UIImageView = {
            let imageView = UIImageView(frame: .zero)
            imageView.image = UIImage(named: "BG")
            imageView.contentMode = .scaleToFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        // gradient layer for background
        let gradientLayerForBG: CAGradientLayer = {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor(red: 0, green: 0.008, blue: 0.063, alpha: 0).cgColor,
                                    UIColor(red: 0, green: 0.008, blue: 0.063, alpha: 1).cgColor]
            gradientLayer.locations = [0.0, 1.0]
            // Set the start and end points for the gradient layer
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            return gradientLayer
        }()
        // blur effect
        let blurEffectViewForBG: UIVisualEffectView = {
            let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            return blurEffectView
        }()
        view.insertSubview(imageView, at: 0)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        // set background gradient layer
        gradientLayerForBG.frame = view.bounds
        // Add the gradient layer as a sublayer to the background view
        view.layer.insertSublayer(gradientLayerForBG, at: 1)
        // blur effect view for background
        blurEffectViewForBG.frame = view.bounds
        view.insertSubview(blurEffectViewForBG, at: 1)
    }
}

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryViewModel.images.count
    }
    func collectionView(_
                        collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = photoCollectionView.dequeueReusableCell(
            withReuseIdentifier: "photoCollectionViewCell",
            for: indexPath
        ) as? PhotoCollectionViewCell
        guard let cell = cell else { return UICollectionViewCell() }
        guard let url = URL(string: galleryViewModel.images[indexPath.row].previewURL ?? "") else {
            return UICollectionViewCell()
        }
        cell.photoImageView.load(url: url)
        cell.backgroundColor = .black
        cell.layer.cornerRadius = 5
        return cell
    }
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
      ) -> CGSize {
        let widthPerItem = view.frame.width / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
      }
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
      ) -> UIEdgeInsets {
          return UIEdgeInsets.zero
      }
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
      ) -> CGFloat {
        return 5
      }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
