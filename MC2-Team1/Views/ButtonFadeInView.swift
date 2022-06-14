//
//  ButtonFadeInView.swift
//  MC2-Team1
//
//  Created by Kim Insub on 2022/06/12.
//

import SwiftUI

struct ButtonFadeInView: View {
    @Binding var mode: Mode
    
    // param
    let choice: Choice
    
    // define
    @EnvironmentObject var modelData: ModelData
    @AppStorage("paragraphId") var paragraphId: Int = 1
    @AppStorage("Bfriendship") var Bfriendship: Int = 0
    @AppStorage("Cfriendship") var Cfriendship: Int = 0
    @State var opacity: Double = 0
    @State var isButtonHidden = true
    
    var currentParagraph: Paragraph {modelData.filterPara(currentChapter: modelData.currentChapterIndex, id: paragraphId)}
    private let mainFontBold = "NanumMyeongjoBold"

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
            // go to next chapter, need to show bridge view
            if choice.nextParagraphId == -1 {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
                    modelData.currentChapterIndex = choice.nextChapterIndex!
                    modelData.pastParas = [["기록들"]]
                    paragraphId = 1
                }
                withAnimation(.linear(duration: 0.4)) {
                    modelData.bridgeChapterIndex = choice.nextChapterIndex!
                    mode = .bridge
                }
            } else {
                // show next paragraph
                // now save when existing one choice
                if currentParagraph.choices?.count == 1 {
                    modelData.pastParas.append([currentParagraph.content])
                } else if currentParagraph.choices?.count == 2 {
                    modelData.pastParas.append([currentParagraph.content, choice.content])
                }
                paragraphId = choice.nextParagraphId
                if let effectB = choice.effectB {
                    Bfriendship += effectB
                }
                if let effectC = choice.effectC {
                    Cfriendship += effectC
                }
            }
        } label: {
            Text(choice.content)
                .foregroundColor(.fontColor)
                .font(.custom(mainFontBold, size: 18))
                .frame(maxWidth: .infinity, maxHeight: RatioSize.getResheight(height: 60))
                .background(Color.bgColor)
                .cornerRadius(50)
                .shadow(color: Color("ButtonShadow"), radius: 3, x: 0, y: 0)
                .padding(.horizontal)
                .padding(.vertical, RatioSize.getResheight(height: 5))
        }
    }
}
