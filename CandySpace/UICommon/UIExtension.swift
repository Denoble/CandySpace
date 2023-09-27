//
//  UICommon.swift
//  CandySpace
//
//  Created by William Rozier on 9/26/23.
//

import SwiftUI


extension CGFloat {
    
    static var screenWidth: Double {
        return UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: Double {
        return UIScreen.main.bounds.size.height
    }
    
    static var topInsets: Double {
          if let keyWindow = UIApplication.shared.keyWindow {
              return keyWindow.safeAreaInsets.top
          }
          return 0.0
      }
      
      static var bottomInsets: Double {
          if let keyWindow = UIApplication.shared.keyWindow {
              return keyWindow.safeAreaInsets.bottom
          }
          return 0.0
      }
}

extension Color {
    
    static var primaryApp: Color {
        return Color("F94D00")
    }
    
    static var primaryText: Color {
        return Color.black
    }
    
    static var secondaryText: Color {
        return Color("7C7C7C")
    }
    
    static var textTitle: Color {
        return Color("7C7C7C")
    }
    
    static var placeHolder: Color {
        return Color("B1B1B1")
    }
    
    static var darkGrey: Color {
        return Color("4C4F4D")
    }
}

struct ShowButton: ViewModifier {
    @Binding var isShow: Bool
    
    public func body(content: Content) -> some View {
        
        HStack{
            content
            Button {
                isShow.toggle()
            } label: {
                Image(systemName: isShow ?  "eye.fill" : "eye.slash.fill")
                    .foregroundColor(.textTitle)
            }
        }
    }
}
