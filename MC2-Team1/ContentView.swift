//
//  ContentView.swift
//  MC2-Team1
//
//  Created by Kim Insub on 2022/05/23.
//

import SwiftUI

struct ContentView: View {
    
    // Define
    @EnvironmentObject var modelData: ModelData
    @State var paragraphId = 1
    @State var viewReloader = true
    var currentParagraph: Paragraph {modelData.filterPara(id: paragraphId)}
    let NotoSerifMedium = "NotoSerifKR-Medium"
    
    // Body
    var body: some View {
        VStack {
            Spacer()
            
            //Content
            reloadView(text: currentParagraph.content)
            
            Spacer()
            
            //Choices
            if currentParagraph.hasChoices() {
                ForEach(currentParagraph.choices!, id: \.self) {choice in
                    Text(choice.content)
                        .font(.custom(NotoSerifMedium, size: 18))
                        .onTapGesture {
                            paragraphId = choice.nextParagraphId
                            viewReloader.toggle()
                        }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

extension ContentView {
    @ViewBuilder func reloadView(text: String) -> some View {
        if viewReloader {
            FadeInOutView(text: text)
        } else {
            FadeInOutView(text: text)
        }
    }
}
