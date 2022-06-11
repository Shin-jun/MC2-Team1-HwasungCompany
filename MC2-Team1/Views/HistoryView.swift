//
//  HistoryView.swift
//  MC2-Team1
//
//  Created by peo on 2022/06/09.
//

import SwiftUI

struct HistoryView: View {
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
    
    let chapterNames = [
        "낯선 방",
        "백연우",
        "최지원"
    ]
    
    let texts = [["새로운 사람을 발견한 기쁨도 잠시였다. 만약 저 자가 사람을 죽인 범인이라면 어떡하지?",
                  "긴장한 나머지 손에서 문고리가 미끄러지면서 문이 열렸다.",
                  "비릿한 향을 따라 시선이 차츰 옮겨졌다.",
                  "손을 씻고 있던 움직임이 멎고 반절 이상 열린 문을 경계로 뒤돌아선 그 자와 나의 눈이 마주쳤다."
                 ],
                 [
                    "나는 뒤로 주춤거리며 물러섰다. 다른 곳으로 나갈 만한 문은 보이지 않았다",
                    "\"죽은 줄만 알았는데 살아 계셨군요! 다행입니다. 어디 아프신 곳은 없으신가요?\"",
                    "피를 흘린 채 쓰러져 있는 사람 하나가 방의 어느 구석에 있었다.",
                    "마치 걱정했다는 듯한 얼굴로 말했다. 그는 세면대 옆의 수건에 아무렇지 않게 손을 닦으며 말했다."
                 ],
                 [
                    "비릿한 향을 따라 시선이 차츰 옮겨졌다. 피를 흘린 채 쓰러져 있는 사람 하나가 방의 어느 구석에 있었다.",
                    "텍스트만 있는 경우 하나의 책같은 느낌이다. 버튼이 좀 더  직관적으로 선택이 가능하다고 느껴진다.",
                    "속이 울렁거렸다.",
                    "글씨만 있는 경우 구분선이 있더라도 누른다는 인지를 못할 것 같다."
                 ]
    ]
    
    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                LazyVStack(spacing: 0) {
                    ForEach(0..<chapterNames.count, id: \.self) { chapterIndex in
                        Section(content: {
                            ForEach(0..<texts[chapterIndex].count, id: \.self) { textIndex in
                                Text(texts[chapterIndex][textIndex])
                                    .font(.custom("NotoSerifKR-Regular", size: 18))
                                    .kerning(2)
                                    .lineSpacing(10)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.vertical, 20)
                                    .padding(.horizontal, 20)
                                    .id((chapterIndex*4 + textIndex))
                            }
                        }, header: {
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
                        })
                    }
                    Spacer()
                }
                .onAppear {
                    proxy.scrollTo(11, anchor: .top)
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
}
