//
//  LoginView.swift
//  CandySpace
//
//  Created by Lawrence on 9/26/23.
//

import SwiftUI
import UIKit

struct LoginView: View {
  @StateObject var loginViewModel = LoginViewModel()
  @State private var showSearchView = false

  var body: some View {
    if showSearchView {
      SearchView()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    } else {
      ZStack {
        Image("splash_bg")
          .resizable()
          .scaledToFill()
          .frame(
            width: .screenWidth,
            height: .screenHeight)
        VStack {
          Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 100)
            .padding(.bottom, .screenWidth * 0.3)
          VStack {
            Text("Email")
              .foregroundColor(Color(hex: 0x7C7C7C))
              .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            TextField("Enter your email address", text: $loginViewModel.userEmail)
              .padding()
              .background(Color(hex: 0xECECEC))
              .cornerRadius(5.0)
              .keyboardType(.emailAddress)
              .autocapitalization(.none)
              .disableAutocorrection(true)
              .frame(height: 40)
          }.padding(.bottom, .screenWidth * 0.05)
          VStack {
            Text("Password")
              .foregroundColor(Color(hex: 0x7C7C7C))
              .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            SecureField("Enter your password", text: $loginViewModel.userPassword)
              .padding()
              .background(Color(hex: 0xECECEC))
              .cornerRadius(5)
              .keyboardType(.emailAddress)
              .autocapitalization(.none)
              .disableAutocorrection(true)
              .frame(height: 40)
          }.padding(.bottom, .screenWidth * 0.05)
          Button {
          } label: {
            Text("Forgot Password?")
              .foregroundColor(Color(hex: 0x00083F))
          }
          .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
          .padding(.bottom, .screenWidth * 0.03)
          Button {
            loginViewModel.signIn { error in
              if let error = error {
                print("\(error)")
              } else {
                showSearchView.toggle()
              }
            }
          } label: {
            Text("Login")
              .font(.system(size: 24))
              .foregroundColor(.white)
              .multilineTextAlignment(.center)
          }
          .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 60,
            maxHeight: 60
          )
          .background(Color(hex: 0x00083F))
          .cornerRadius(10)
          .padding(.bottom, 30)
          HStack {
            Text("Dont have an account?")
              .foregroundColor(Color.gray)
            Text("Sign Up?")
              .foregroundColor(Color(hex: 0x00083F))
          }
          Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal, 20)
        .padding(.top, 80)
      }
      .background(Color.white)
      .navigationTitle("")
      .navigationBarBackButtonHidden(true)
      .navigationBarHidden(true)
      .ignoresSafeArea()
    }
  }

}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
