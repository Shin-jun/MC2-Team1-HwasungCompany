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
    var currentParagraph: Paragraph {modelData.filterPara(chapter: chapter, id: paragraphId)}
    let NotoSerifMedium = "NotoSerifKR-Medium"

    var body: some View {
        
        Button{
            modelData.pastParas.append([currentParagraph.content, choice.content])
            paragraphId = choice.nextParagraphId
        } label: {
            Text(choice.content)
                .foregroundColor(.fontColor)
                .font(.custom(NotoSerifMedium, size: 18))
                .frame(maxWidth: .infinity, maxHeight: 60)
                .background(Color.bgColor)
                .cornerRadius(50)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                .padding(.horizontal)
                .padding(.vertical, 5)
        }
        .opacity(opacity)
        .animation(.easeIn.delay( 1.5 ), value: opacity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()){
                opacity = 1
            }
        }
    }
}

