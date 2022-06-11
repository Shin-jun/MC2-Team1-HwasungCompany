//
//  HistoryView.swift
//  MC2-Team1
//
//  Created by peo on 2022/06/09.
//

import SwiftUI

struct testView: View {
    let content: String
    
    var body: some View {
            Text(content)
                .font(.custom("NotoSerifKR-Regular", size: 18))
                .kerning(2)
                .lineSpacing(10)
                .lineLimit(nil)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 20)
                .padding(.horizontal, 20)
        
    }
}

struct HistoryView: View {
    @EnvironmentObject var modelData: ModelData
    @State var lastSize: CGFloat = 0
    @State var recHeight: CGFloat = 0
//    @Binding var showHistory: Bool
//    @State var isLoaded = false
//    var drag: some Gesture {
//        DragGesture()
//            .onChanged { gesture in
//                if gesture.translation.height < -65 {
//                    withAnimation {
//                        showHistory = false
//                    }
//                }
//            }
//    }
    
//    let window = UIApplication.shared.windows.first
    
    var body: some View {
        ScrollView {
                ScrollViewReader { proxy in
                    LazyVStack(spacing: 0) {
                        ForEach(0..<modelData.pastParas.count, id: \.self) { index in
    //                        Text(modelData.pastParas[index])
    //                            .font(.custom("NotoSerifKR-Regular", size: 18))
    //                            .kerning(2)
    //                            .lineSpacing(10)
    //                            .frame(maxWidth: .infinity, alignment: .leading)
    //                            .padding(.vertical, 20)
    //                            .padding(.horizontal, 20)
    //                        FadeInViewReloader(text: modelData.pastParas[index], fontSize: 16)
                            Group {
                                if index == modelData.currentIndex {
                                    Divider()
                                    Rectangle()
                                        .fill(Color.bgColor)
                                        .frame(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - 230 - recHeight) / 2.0) // 310
                                        .onAppear {
                                            recHeight = lastSize
                                        }
                                        .onChange(of: lastSize) { value in
                                            recHeight = value
                                        }
                                }
//                                testView(content: modelData.pastParas[index])
                                FadeInViewReloader(text: modelData.pastParas[index], fontSize: 16)
                                    .id(index)
                                    .background(ViewGeometry())
                                    .onPreferenceChange(ViewSizeKey.self) {
                                        if index == modelData.currentIndex {
                                            lastSize = $0.height
                                            print(lastSize)
                                        }
                                    }
                            }
                            
                        }
    //                    ForEach(0..<chapterNames.count, id: \.self) { chapterIndex in
    //                        Section(content: {
    //                            ForEach(0..<texts[chapterIndex].count, id: \.self) { textIndex in
    //                                Text(texts[chapterIndex][textIndex])
    //                                    .font(.custom("NotoSerifKR-Regular", size: 18))
    //                                    .kerning(2)
    //                                    .lineSpacing(10)
    //                                    .frame(maxWidth: .infinity, alignment: .leading)
    //                                    .padding(.vertical, 20)
    //                                    .padding(.horizontal, 20)
    //                                    .id((chapterIndex*4 + textIndex))
    //                            }
    //                        }, header: {
    //                            HStack {
    //                                Text("Chapter \(chapterIndex)")
    //                                    .font(.custom("NotoSerifKR-Bold", size: 24))
    //
    //                                Text(chapterNames[chapterIndex])
    //                                    .font(.custom("NotoSerifKR-Regular", size: 24))
    //
    //                                Spacer()
    //                            }
    //                            .padding(.leading, 20)
    //                            .padding(.vertical, 10)
    //                            .background(Color.bgColor)
    //                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.1), radius: 4, x: 0, y: 4)
    //                        })
    //                    }
                        Rectangle()
                            .fill(Color.bgColor)
                            .frame(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - 230 - recHeight) / 2.0) // 310
                            .onAppear {
                                recHeight = lastSize
                            }
                            .onChange(of: lastSize) { value in
                                recHeight = value
                            }
                    }
                    .onChange(of: modelData.currentIndex) { value in
//                        withAnimation {
                            proxy.scrollTo(value, anchor: .top)
//                        }
                    }
                    .onAppear {
                        modelData.currentIndex = modelData.pastParas.count - 1
                        proxy.scrollTo(modelData.currentIndex, anchor: .top)
                    }
    //                .background(
    //                    GeometryReader {
    //                        Color.clear.preference(
    //                            key: ViewOffsetKey.self,
    //                            value: -$0.frame(in: .named("scroll")).origin.y
    //                        )
    //                })
    //                .onPreferenceChange(ViewOffsetKey.self) {
    //                    if $0 > 1000 {
    //                        isLoaded = true
    //                    } else if $0 > 735.0 && isLoaded {
    //                        withAnimation {
    //                            showHistory = false
    //                        }
    //                    }
    //                }
                }
            }
            .padding(.top, 1)

//        .coordinateSpace(name: "scroll")
    }
    
    @ViewBuilder func FadeInViewReloader(text: String, fontSize: CGFloat) -> some View {
//        if reloadTrigger {
//            FadeInView(text: text, fontSize: fontSize, isTextAnimation: true)
//        } else {
//            FadeInView(text: text, fontSize: fontSize, isTextAnimation: true)
//        }
        FadeInView(text: text, fontSize: fontSize, isTextAnimation: true)
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
            .padding(.vertical, 10)
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
