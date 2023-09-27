//
//  SearchView.swift
//  CandySpace
//
//  Created by Lawrence on 9/26/23.
//

import Foundation
import SwiftUI

struct SearchView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SearchViewController
    func makeUIViewController(context: Context) -> SearchViewController {
        let viewController = SearchViewController()
        return viewController
    }
    func updateUIViewController(_ uiViewController: SearchViewController, context: Context) {
        //
    }
}
