//
//  InitView.swift
//  MC2-Team1
//
//  Created by peo on 2022/06/11.
//

import SwiftUI

struct InitView: View {
    @State var mode: Mode = .start
    @AppStorage("isFirstLaunching") var isFirstLaunching: Bool = true
    
    var body: some View {
        if isFirstLaunching {
            OnBoardingView(isFirstLaunching: $isFirstLaunching)
                .ignoresSafeArea()
        } else {
            switch mode {
            case .start:
                StartView()
                    .onTapGesture {
                        withAnimation(.spring()) {
                            mode = .content
                        }
                    }
            case .content:
                ContentView(mode: $mode)
            case .bridge:
                BridgeView(mode: $mode)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            mode = .content
                        }
                    }
            case .credit:
                CreditView()
                    .onTapGesture {
                        withAnimation(.spring()) {
                            mode = .start
                        }
                    }
            case .endingBridge:
                EndingBridgeView()
            }
        }
    }
}

enum Mode {
    case start
    case content
    case bridge
    case credit
    case endingBridge
}
