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
        let navigationViewController =
        storyboard.instantiateViewController(withIdentifier: "MainNavigationController") as? UINavigationController
        let searchViewController =
        storyboard.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController
        navigationViewController?.modalPresentationStyle = .fullScreen
        return navigationViewController ?? UINavigationController()
    }
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        //
    }
}
