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
    // MiniGame
    @AppStorage("isGlassGame") var isGlassGame = false
    @AppStorage("isPullLeverGame") var isPullLeverGame = false
    @AppStorage("isBoxOpenGame") var isBoxOpenGame = false
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
                modelData.currentChapterIndex = choice.nextChapterIndex!
                modelData.pastParas = [["기록들"]]
                paragraphId = 1
                withAnimation {
                    mode = .bridge
                }
            } else {
                // show next paragraph
                modelData.pastParas.append([currentParagraph.content, choice.content])
                paragraphId = choice.nextParagraphId
                if let effectB = choice.effectB {
                    withAnimation(.linear) {
                        Bfriendship += effectB
                    }
                }
                if let effectC = choice.effectC {
                    withAnimation(.linear) {
                        Cfriendship += effectC
                    }
                }
                if let gameName = currentParagraph.game {
                    switch gameName {
                    case "GlassAnimation":
                        isGlassGame = true
                    case "PullLeverGame":
                        isPullLeverGame = true
                    case "BoxOpen":
                        isBoxOpenGame = true
                    default:
                        break
                    }
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
