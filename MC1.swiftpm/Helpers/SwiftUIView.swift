//
//  SwiftUIView.swift
//  
//
//  Created by CHANG JIN LEE on 2023/03/29.
//

import SwiftUI

extension View{
    // MARK: Building a Custom Modifier for Custom Popup navigation View
    func popupNavigationView<Content: View>(horizontalPadding: CGFloat = 40, show: Binding<Bool>, @ViewBuilder content: @escaping () ->Content)->some View{
        return self
            .frame (maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .overlay {
                if show.wrappedValue{
                    // MARK: Geometry Reader for reading Container Frame
                    GeometryReader{proxy in
                        
                        Color.primary
                            .opacity(0.15)
                            .ignoresSafeArea()
                        
//                        let size = proxy.size
                        NavigationView{
                            content ( )
                            Image("test8")
                        }
//                        .frame (width: size.width - horizontalPadding, height: size.height /
//                                1.7, alignment: .center)
                        .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 1.5, alignment: .center)
                        // Corner Radius
                        .cornerRadius (15)
                        .frame (maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        
                        
                    }
                }
            }
    }
}
