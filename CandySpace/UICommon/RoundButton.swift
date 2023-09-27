//
//  RoundButton.swift
//  CandySpace
//
//  Created by Amali Krigger on 9/27/23.
//

import Foundation

import SwiftUI

struct RoundButton: View {
    
    @State var title: String = "Title"
    var didTap: (()->())?
    
    var body: some View {
        
        Button {
            didTap?()
        } label: {
            Text ("Get Started")
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
        
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 60 ,
            maxHeight: 60
        )
        .background(Color.primaryApp)
        .cornerRadius(20)
        
        
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton()
            .padding(20)
    }
}
