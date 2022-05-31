//
//  FadeInView.swift
//  MC2-Team1
//
//  Created by Kim Insub on 2022/05/31.
//

import SwiftUI

struct FadeInView: View {
    
    // Define
    var text: String
    var fontSize: CGFloat
    @State var opacity: Double = 0
    let NotoSerifMedium = "NotoSerifKR-Medium"
    
    // body
    var body: some View {
        Text(text)
            .font(.custom(NotoSerifMedium, size: fontSize))
            .opacity(opacity)
            .animation(.easeIn.delay( 0.3 ), value: opacity)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now()){
                    opacity = 1
                }
            }
    }
    
}
