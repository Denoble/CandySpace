//
//  SearchView.swift
//  CandySpace
//
//  Created by Lawrence on 9/26/23.
//

import Foundation
import SwiftUI

struct SearchView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UINavigationController
    func makeUIViewController(context: Context) -> UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let navigationViewController =
                storyboard.instantiateViewController(
                    withIdentifier: "MainNavigationController")
                as? UINavigationController else {
            return UINavigationController()
        }
        guard let searchViewController =
                storyboard.instantiateViewController(
                    withIdentifier: "SearchViewController")
                as? SearchViewController else {
            return UINavigationController()
        }
        navigationViewController.viewControllers = [searchViewController]
        return navigationViewController
    }
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        //
    }
}
