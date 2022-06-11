//
//  HistoryView.swift
//  MC2-Team1
//
//  Created by peo on 2022/06/09.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var modelData: ModelData
    @State var lastSize: CGFloat = 0
    @State var recHeight: CGFloat = 0
    @AppStorage("fontSize") var fontSize: Double = 18
    
    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                LazyVStack(spacing: 0) {
                    ForEach(0..<modelData.pastParas.count, id: \.self) { index in
                        Group {
                            if index == modelData.currentIndex {
                                Rectangle()
                                    .fill(Color.bgColor)
                                    .frame(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - 230 - recHeight) / 2.0)
                                    .onAppear {
                                        recHeight = lastSize
                                    }
                                    .onChange(of: lastSize) { value in
                                        recHeight = value
                                    }
                            }
                            FadeInView(text: modelData.pastParas[index], fontSize: fontSize, isTextAnimation: true)
                                .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                                .padding(.vertical, fontSize + 6)
                                .id(index)
                                .background(ViewGeometry())
                                .onPreferenceChange(ViewSizeKey.self) {
                                    if index == modelData.currentIndex {
                                        lastSize = $0.height
                                    }
                                }
                        }
                        
                    }
                    
                    Rectangle()
                        .fill(Color.bgColor)
                        .frame(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - 230 - recHeight) / 2.0)
                        .onAppear {
                            recHeight = lastSize
                        }
                        .onChange(of: lastSize) { value in
                            recHeight = value
                        }
                }
                .onChange(of: modelData.currentIndex) { value in
                    proxy.scrollTo(value, anchor: .top)
                }
                .onAppear {
                    modelData.currentIndex = modelData.pastParas.count - 1
                    proxy.scrollTo(modelData.currentIndex, anchor: .top)
                }
            }
        }
        .padding(.top, 1)
    }
}

struct ViewSizeKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct ViewGeometry: View {
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: ViewSizeKey.self, value: geometry.size)
        }
    }
}
