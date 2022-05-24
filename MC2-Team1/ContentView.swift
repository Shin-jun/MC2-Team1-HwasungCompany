//
//  ContentView.swift
//  MC2-Team1
//
//  Created by Kim Insub on 2022/05/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    

    var body: some View {
        let chapterOne = modelData.chapterOne
                
        Text("Hello, world!")
            .padding()
            .onAppear{
                for para in chapterOne{
                    print(para.content)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
