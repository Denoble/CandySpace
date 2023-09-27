//
//  ViewController.swift
//  CandySpace
//
//  Created by Uche Godfrey on 9/15/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    let loginView = UIHostingController(rootView: LoginView())
    let loginVM = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        styleSetting()
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
            self.navigationController?.pushViewController(self.loginView, animated: true)
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
        // inset background image
        view.insertSubview(imageView, at: 0)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        // set gradient layer frame and position
        gradientLayerForBG.frame = CGRect(x: 0,
                                     y: view.frame.height * 3 / 4,
                                     width: view.frame.width,
                                     height: view.frame.height / 4)
        // Add the gradient layer as a sublayer to the background view
        view.layer.insertSublayer(gradientLayerForBG, at: 1)
    }
}
