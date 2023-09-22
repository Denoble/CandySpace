//
//  PhotoViewController.swift
//  CandySpace
//
//  Created by Lawrence on 9/22/23.
//

import UIKit
import Combine

class PhotoViewController: UIViewController {
//    var photoTitle: String?
    var photoUrl: String?
    var anyCancelable: AnyCancellable?
    private let galleryViewModel = GalleryViewModel(networkManager: NetworkManager())
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        styleSetting()
        anyCancelable = galleryViewModel.$state.receive(on: DispatchQueue.main).sink(receiveValue: { state in
            switch state {
            case .loading:
                self.spinner.isHidden = false
                self.spinner.startAnimating()
            case .loaded:
                self.spinner.isHidden = true
                self.spinner.stopAnimating()
            case .error:
                self.throwAlert(title: "Oops!", errorMessage: "Something went wrong")
            }
        })
        Task {
            guard let url = URL(string: photoUrl ?? "") else { return }
            let image = await galleryViewModel.getImage(url: url)
            photoImageView.image = image
        }
        navigationItem.backButtonTitle = "Back"
//        print(photoTitle)
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
    func throwAlert(title: String, errorMessage: String) {
        let alert = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
}
