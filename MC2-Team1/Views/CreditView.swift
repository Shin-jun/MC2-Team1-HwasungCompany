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
    

    // animation 지속시간
    private let startAnimationDuration = 5.0
    private let middleAnimationDuration = 6.0
    private let endAnimationDuration = 0.5
    @State var attributedString = AttributedString("화성상사\n\n Woody \n Digi \n Bethev \n EllyJ \n Rang \n Sophie \n Everett \n\n And You")
    @State var opacity: Double = 0
    
    var body: some View {
        ZStack {
            Color.bgColor.ignoresSafeArea()
            Text(attributedString)
                .fontWeight(.bold)
                .foregroundColor(.fontColor)
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
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
