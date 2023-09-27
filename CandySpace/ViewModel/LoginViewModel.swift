//
//  LoginViewModel.swift
//  CandySpace
//
//  Created by Lawrence on 9/26/23.
//

import Foundation
import Firebase
import UIKit
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var userEmail = ""
    @Published var userPassword = ""
    var loggedIn: Bool = false
    func signIn(completionHandler: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { [weak self] (_, error) in
            if let error = error {
              print(error.localizedDescription)
                completionHandler(error)
            } else {
//              self.state = .signedIn
                print("vmSE: \(self?.userEmail)")
                print("vmSP: \(self?.userPassword)")
                print("success")
                completionHandler(nil)
//                hostingVIewController.navigationController?.pushViewController(SearchViewController(), animated: true)
//                UINavigationController.pushViewController(searchViewController, animated: true)
            }
          }
    }
}
