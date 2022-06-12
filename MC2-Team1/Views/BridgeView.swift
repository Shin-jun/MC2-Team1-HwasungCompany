//
//  NextChapterView.swift
//  MC2-Team1
//
//  Created by peo on 2022/06/11.
//

import SwiftUI

struct BridgeView: View {
    @State private var tapFontColorOpacity = true
    @Binding var mode: Mode
    
    private let textWidth = width * 0.88
    private let textPadding = width * 0.12
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.bgColor
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Spacer()
                
                ZStack {
                    HStack {
                        Rectangle()
                            .fill(Color.fontColor)
                            .frame(maxWidth: CGFloat(3 * (50 + 17) + 50), maxHeight: 2)
                        Rectangle()
                            .fill(Color.pastColor)
                            .frame(maxWidth: UIScreen.main.bounds.width - CGFloat(3 * (50 + 17) + 50), maxHeight: 2)
                    }
                    
                    HStack(alignment: .center, spacing: 50) {
                        Spacer()
                        ForEach(0..<6, id: \.self) { index in
                            DotView(circleIndex: index, chapterIndex: 3)
                        }
                        Spacer()
                    }
                }
                
                HStack {
                    Spacer()
                    Text("Chapter 1")
                        .font(.custom("NuosuSIL-Regular", size: 24))
                        .foregroundColor(.fontColor)
                        .padding(.top, 30)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("\"낯선 방\"")
                        .font(.custom("NotoSerifKR-Regular", size: 20))
                        .foregroundColor(.fontColor)
                    Spacer()
                }
                .padding(.top, 10)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("탭해서 시작하기")
                        .font(.custom("Inter-SemiBold", size: 20))
                        .foregroundColor(.tapFontColor)
                        .opacity(tapFontColorOpacity ? 1 : 0)
                        .animation(.linear(duration: 1).repeatForever(), value: tapFontColorOpacity)
                        .onAppear {
                            tapFontColorOpacity.toggle()
                        }
                    Spacer()
                }
                .padding(.bottom, 60)
            }
            .padding(.top, 120)
        }
    }
}
