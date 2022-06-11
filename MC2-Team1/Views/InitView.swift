//
//  InitView.swift
//  MC2-Team1
//
//  Created by peo on 2022/06/11.
//

import SwiftUI

struct InitView: View {
    @State var isTapped = false
    
    var body: some View {
        if isTapped {
            ContentView()
        } else {
            StartView()
                .onTapGesture {
                    withAnimation(.spring()) {
                        isTapped = true
                    }
                }
        }
    }
}
