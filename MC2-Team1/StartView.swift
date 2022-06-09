//
//  StartView.swift
//  MC2-Team1
//
//  Created by peo on 2022/06/09.
//

import SwiftUI

struct StartView: View {
    let NotoSerifMedium = "NotoSerifKR-SemiBold"
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.bgColor
            
            VStack(alignment: .leading, spacing: 0) {
                Text("NIPS")
                    .font(.custom(NotoSerifMedium, size: 96))
                    .foregroundColor(.fontColor)
                
                
            }
            .padding(.top, 40)
        }
    }
}

extension Color {
    static let bgColor = Color("BackGround")
    static let fontColor = Color("Font")
}
