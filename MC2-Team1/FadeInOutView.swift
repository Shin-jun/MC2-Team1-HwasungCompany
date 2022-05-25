//
//  Blue.swift
//  MC2-Team1
//
//  Created by Kim Insub on 2022/05/25.
//

import SwiftUI

struct FadeInOutView: View {
    
    @State var characters: Array<String.Element>
    @State var opacity: Double = 0
    @State var baseTime: Double
    
    let NotoSerifMedium = "NotoSerifKR-Bold"
    
    init(text: String, startTime: Double) {
        characters = Array(text)
        baseTime = startTime
    }
    
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<characters.count) { num in
                Text(String(self.characters[num]))
                    .font(.custom(NotoSerifMedium, size: 18))
                    .opacity(opacity)
                    .animation(.easeInOut.delay( Double(num) * 0.015 ),
                               value: opacity)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + baseTime){
                opacity = 1
            }
        }
    }
}
