//
//  ContentView.swift
//  MC2-Team1
//
//  Created by Kim Insub on 2022/05/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var filteredPara: [Paragraph] {
           modelData.chapterOne.filter { paragraph in
               paragraph.id == 1
           }
        }

    var body: some View {
        
        let PARA = filteredPara[0]
        
        Text(PARA.content)
            .padding()
            .font(.body)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
