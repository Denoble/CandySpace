//
//  LoginView.swift
//  CandySpace
//
//  Created by Lawrence on 9/26/23.
//

import SwiftUI
import UIKit
import Firebase

struct LoginView: View {
    @StateObject var loginViewModel = LoginViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var isShowingSearchingView = false
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Email: ")
                    TextField("Enter Email", text: $loginViewModel.userEmail)
                        .keyboardType(.emailAddress)
                }
                HStack {
                    Text("Password: ")
                    SecureField("Enter Password", text: $loginViewModel.userPassword)
                }
                Button(
                    action: {
                        print("userEmail: \(loginViewModel.userEmail)")
                        print("userPassword: \(loginViewModel.userPassword)")
                        loginViewModel.signIn { error in
                            if let error = error {
                                print("LoginView: \(error)")
                            } else {
//                                dismiss()
                                isShowingSearchingView = true
                            }
                        }
                    }, label: {
                        Text("Login")
                    })
            }
            .navigationDestination(isPresented: $isShowingSearchingView, destination: {
                SearchView()
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
}
