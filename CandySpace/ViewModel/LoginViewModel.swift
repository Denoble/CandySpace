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
    func signIn(completionHandler: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { [weak self] (_, error) in
            if let error = error {
              print(error.localizedDescription)
                completionHandler(error)
            } else {
                print("email: \(self?.userEmail ?? "")")
                print("password: \(self?.userPassword ?? "")")
                print("success")
                let userDefault = UserDefaults.standard
                userDefault.setValue(Date.now, forKey: "LoginTime")
                userDefault.synchronize()
                completionHandler(nil)
            }
          }
    }
}
