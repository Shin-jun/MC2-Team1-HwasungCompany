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
    
    // Body
    var body: some View {
        let currentParagraph = modelData.filterPara(id: paragraphId)
        
        //Content
        Text(currentParagraph.content)
            .padding()
            .font(.body)
        
        //Choices
        if currentParagraph.hasChoices() {
            
            ForEach(currentParagraph.choices!, id: \.self) {choice in
                Text(choice.content)
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
