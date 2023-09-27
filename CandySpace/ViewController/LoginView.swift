//
//  LoginView.swift
//  CandySpace
//
//  Created by Lawrence on 9/26/23.
//

import Firebase
import SwiftUI
import UIKit

struct LoginView: View {
  @StateObject var loginViewModel = LoginViewModel()
  @State private var isShowingSearchingView = false

  @Environment(\.dismiss) var dismiss
  var body: some View {

    if isShowingSearchingView {
      SearchView()
        .frame(
          width: .screenWidth,
          height: .screenHeight)
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
            print("userEmail: \(loginViewModel.userEmail)")
            print("userPassword: \(loginViewModel.userPassword)")
            loginViewModel.signIn { error in
              if let error = error {
                print("LoginView: \(error)")
              } else {
                isShowingSearchingView.toggle()
              }
            }
          } label: {
            Text("Login")
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
          .cornerRadius(20)
          HStack {
            Text("Dont have an account?")
              .foregroundColor(Color.gray)
            Text("Sign Up?")
              //                        .font(.customfont(.medium , fontSize: 14))
              .foregroundColor(Color(hex: 0x00083F))
          }
          Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal, 20)
        .padding(.top, 80)
      }
      //        .alert(isPresented: $loginVM.showError){
      //            Alert(title: Text(Globs.AppName), message: Text(loginVM.errorMessage),
      //                  dismissButton: .default(Text("Ok")))
      //        }
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
