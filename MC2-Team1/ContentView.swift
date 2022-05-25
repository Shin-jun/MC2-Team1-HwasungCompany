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
    let NotoSerifMedium = "NotoSerifKR-Bold"
    
    // Body
    var body: some View {
        let currentParagraph = modelData.filterPara(id: paragraphId)
        
        //Content
        FadeInOutView(text: currentParagraph.content, startTime: 0.1)        
        
        //Choices
        if currentParagraph.hasChoices() {
            
            ForEach(currentParagraph.choices!, id: \.self) {choice in
                Text(choice.content)
                    .font(.custom(NotoSerifMedium, size: 18))
                    .onTapGesture {
                        paragraphId = choice.nextParagraphId
                    }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
