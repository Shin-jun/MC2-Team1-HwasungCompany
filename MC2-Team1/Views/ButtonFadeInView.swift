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
    @State var opacity: Double = 0
    @State var isButtonHidden = true
    var currentParagraph: Paragraph {modelData.filterPara(chapter: chapter, id: paragraphId)}
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
            modelData.pastParas.append([currentParagraph.content, choice.content])
            paragraphId = choice.nextParagraphId
        } label: {
            Text(choice.content)
                .foregroundColor(.fontColor)
                .font(.custom(mainFontBold, size: 18))
                .frame(maxWidth: .infinity, maxHeight: 60)
                .background(Color.bgColor)
                .cornerRadius(50)
                .shadow(color: Color("ButtonShadow"), radius: 3, x: 0, y: 0)
                .padding(.horizontal)
                .padding(.vertical, RatioSize.getResheight(height: 5))
        }
    }
}
