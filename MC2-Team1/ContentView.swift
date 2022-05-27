//
//  ContentView.swift
//  MC2-Team1
//
//  Created by Kim Insub on 2022/05/23.
//

import SwiftUI
import WrappingHStack

struct ContentView: View {
    
    // Define
    @EnvironmentObject var modelData: ModelData
    @State var paragraphId = 1
    @State var viewReloader = true
    let NotoSerifMedium = "NotoSerifKR-Medium"
    var currentParagraph: Paragraph {modelData.filterPara(id: paragraphId)}
    
    // Body
    var body: some View {
        VStack {
            Spacer()
            
            //Content
            if viewReloader {
                FadeInOutView(text: currentParagraph.content)
            } else {
                FadeInOutView(text: currentParagraph.content)
            }
            
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
