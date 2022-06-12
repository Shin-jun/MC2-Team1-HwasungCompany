//
//  ButtonFadeInView.swift
//  MC2-Team1
//
//  Created by Kim Insub on 2022/06/12.
//

import SwiftUI

struct ButtonFadeInView: View {
    
    // param
    let choice: Choice
    
    // define
    @EnvironmentObject var modelData: ModelData
    @AppStorage("paragraphId") var paragraphId: Int = 1
    @AppStorage("chapter") var chapter: String = "chapterOne"
    @AppStorage("Bfriendship") var Bfriendship: Int = 0
    @AppStorage("Cfriendship") var Cfriendship: Int = 0
    @State var opacity: Double = 0
    @State var isButtonHidden = true
    var currentParagraph: Paragraph {modelData.filterPara(chapter: chapter, id: paragraphId)}
    let NotoSerifMedium = "NotoSerifKR-Medium"

    var body: some View {
        
        Group{
            if isButtonHidden {
                buttonViewBuilder()
                    .hidden()
            } else {
                buttonViewBuilder()
                   .opacity(opacity)
                   .animation(.easeIn.delay( 0.1 ), value: opacity)
                   .onAppear {
                       DispatchQueue.main.asyncAfter(deadline: .now()){
                           opacity = 1
                       }
                   }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                self.isButtonHidden = false
            }
        }
    }
}

extension ButtonFadeInView{
    @ViewBuilder func buttonViewBuilder() -> some View {
        Button{
            modelData.pastParas.append([currentParagraph.content, choice.content])
            paragraphId = choice.nextParagraphId
            if let effectB = choice.effectB {
                Bfriendship += effectB
            }
            if let effectC = choice.effectC {
                Cfriendship += effectC
            }
        } label: {
            Text(choice.content)
                .foregroundColor(.fontColor)
                .font(.custom(NotoSerifMedium, size: 18))
                .frame(maxWidth: .infinity, maxHeight: RatioSize.getResheight(height: 60))
                .background(Color.bgColor)
                .cornerRadius(50)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                .padding(.horizontal)
                .padding(.vertical, RatioSize.getResheight(height: 5))
        }
    }
}
