//
//  CreditView.swift
//  MC2-Team1
//
//  Created by Shin yongjun on 2022/06/15.
//

//https://www.appcoda.com/star-wars-animated-text-swiftui/

import SwiftUI
import AVFoundation


struct CreditView: View {
    @State private var animationStart = false
    @State private var animationEnd = false
    @EnvironmentObject var modelData: ModelData
    @Binding var mode: Mode
    

    // animation 지속시간
    private let startAnimationDuration = 5.0
    private let middleAnimationDuration = 6.0
    private let endAnimationDuration = 0.5
    @State var attributedString = AttributedString("화성상사\n\n회장 Woody \n최고학력자 Digi \n영양사 Bethev \n충전 EllyJ \n글루건 Rang \n원어민 Sophie \n과장 Everett \n\n And You")
    @State var opacity: Double = 0
    
    var body: some View {
        ZStack {
            Image("EndCreditBackgroud")
                .resizable()
            Text(attributedString)
                .fontWeight(.bold)
                .font(.custom(modelData.contentFontName, size: 35))
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .truncationMode(.head)
                .lineSpacing(10)
                .padding()
            
            
                .rotation3DEffect(.degrees(animationEnd ? 0 : 35), axis: (x: 1, y: 0, z: 0))
                .shadow(color: .gray, radius: 4, x: 0, y: 2)
                .frame(width: 500, height: animationStart ? 750 : 0)
                //.animation(Animation.linear(duration: startAnimationDuration), value: opacity)
                .onAppear() {
                    attributeItem(text: "회장")
                    attributeItem(text: "최고학력자")
                    attributeItem(text: "영양사")
                    attributeItem(text: "충전")
                    attributeItem(text: "글루건")
                    attributeItem(text: "원어민")
                    attributeItem(text: "과장")
                    
                    withAnimation(.linear(duration: animationEnd ? endAnimationDuration : startAnimationDuration)) {
                        self.animationStart.toggle()
                        opacity = 1
                    }
                    // animation 시간 후 animationEnd true
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.middleAnimationDuration) {
                        withAnimation {
                            self.animationEnd.toggle()
                        }
                    }
            }
        }
        .ignoresSafeArea()
    }
    
    func attributeItem(text: String) {
        let range = attributedString.range(of: text)!
        attributedString[range].font = .custom(modelData.contentFontName, size: 20)
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView(mode: .constant(.credit))
    }
}
