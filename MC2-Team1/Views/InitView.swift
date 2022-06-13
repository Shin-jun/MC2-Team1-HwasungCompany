//
//  InitView.swift
//  MC2-Team1
//
//  Created by peo on 2022/06/11.
//

import SwiftUI

struct InitView: View {
    @State var mode: Mode = .start
    
    @AppStorage("chapter") var chapter: String = "chapterSix"
    
    var body: some View {
        switch mode {
        case .start:
            StartView()
                .onTapGesture {
                    withAnimation(.spring()) {
                        mode = .content
                    }
                }
                .onAppear {
                    chapter = "chapterSix"
                }
        case .content:
            ContentView(mode: $mode)
        case .bridge:
            BridgeView(mode: $mode)
        }
    }
}

enum Mode {
    case start
    case content
    case bridge
}
