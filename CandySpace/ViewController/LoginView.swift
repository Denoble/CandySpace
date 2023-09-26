//
//  LoginView.swift
//  CandySpace
//
//  Created by Lawrence on 9/26/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var userEmail: String = ""
    @State var userPassword: String = ""
    var body: some View {
        VStack {
            HStack {
                Text("Email: ")
                TextField("Enter Email", text: $userEmail)
                    .keyboardType(.emailAddress)
            }
            HStack {
                Text("Password: ")
                SecureField("Enter Password", text: $userPassword)
            }
            Button(action: {                
                print("userEmail: \(userEmail)")
                print("userPassword: \(userPassword)")
                
//                Auth.auth().signIn(withEmail: userEmail, password: userPassword) { [weak self] authResult, error in
//                  guard let strongSelf = self else { return }
//                  // ...
//                }
            }, label: {
                Text("Login")
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
}
