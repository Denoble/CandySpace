//
//  SearchViewController.swift
//  CandySpace
//
//  Created by Lawrence on 9/19/23.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchBarView: UIView!
    @IBAction func searchButtonAction(_ sender: Any) {
        self.performSegue(withIdentifier: "toGallery", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        styleSetting()
        // hide navigation back button
        self.navigationItem.hidesBackButton = true
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
        // gradient layer for search button
        let gradientLayerForSearchButton: CAGradientLayer = {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor(red: 0.396, green: 0.451, blue: 0.929, alpha: 1).cgColor,
                                    UIColor(red: 0.078, green: 0.824, blue: 0.902, alpha: 1).cgColor]
            gradientLayer.locations = [0.0, 1.0]
            // Set the start and end points for the gradient layer
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.cornerRadius = 20
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
        // background gradient layer setting
        gradientLayerForBG.frame = view.bounds
        // Add the gradient layer as a sublayer to the background view
        view.layer.insertSublayer(gradientLayerForBG, at: 1)
        // search button gradient layer setting
        gradientLayerForSearchButton.frame = searchButton.bounds
        searchButton.layer.insertSublayer(gradientLayerForSearchButton, at: 0)
        // blur effect view for background
        blurEffectViewForBG.frame = view.bounds
        view.insertSubview(blurEffectViewForBG, at: 1)
        // seach Bar view setting
        searchBarView.backgroundColor = UIColor(red: 0.008, green: 0.02, blue: 0.122, alpha: 0.75)
        searchBarView.layer.cornerRadius = 20
        // textfield text color setting
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search for Photos",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let galleryViewController = segue.destination as? GalleryViewController
        galleryViewController?.query = searchTextField.text
    }
}
