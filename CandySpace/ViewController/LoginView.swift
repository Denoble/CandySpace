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
    @State var showPassword: Bool = false
    var body: some View {
        ZStack  {
            Image("splash_bg")
                .resizable()
                .scaledToFill()
                .frame( width: .screenWidth,
                        height: .screenHeight )
            VStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:100)
                    .padding(.bottom, .screenWidth * 0.1)
                
                Text("Enter you email and password")
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                LineTextField( title:"Email", placeholder: "Enter your email address", txt: $userEmail, keyboardType: .emailAddress)
                    .padding(.bottom,.screenWidth * 0.07)
                
                LineSecureField( title:"Password", placeholder:"Enter your password", txt: $userPassword, isShowPassword: $showPassword)
                    .padding(.bottom,.screenWidth * 0.02)
                
                Button {
                    
                } label: {
                    Text("Forgot Password?")
                        .foregroundColor(.primaryText)
                }
                .frame(minWidth:0 , maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom,.screenWidth * 0.03)
                
                RoundButton(title: "Log In") {
                    //                    loginVM.serviceCallLogin()
                }
                .padding(.bottom,.screenWidth * 0.05)
                
                
                HStack{
                    Text("Dont have an account?")
                        .foregroundColor(.primaryText)
                    Text("Sign Up?")
//                        .font(.customfont(.medium , fontSize: 14))
                        .foregroundColor(.primaryApp)
                    
                }
                Spacer()
                
                
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.top, .bottomInsets)
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

// #Preview {
//    LoginView()
// }
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
