//
//  StartView.swift
//  MC2-Team1
//
//  Created by peo on 2022/06/09.
//

import SwiftUI

struct StartView: View {
    @State private var tapFontColorOpacity = true
    
    @AppStorage("chapter") var chapter: String = "chapterOne" {
        didSet {
            switch chapter {
            case "chapterOne":
                chapterIndex = 0
            case "chapterTwo":
                chapterIndex = 1
            case "chapterThree":
                chapterIndex = 2
            case "chapterFour":
                chapterIndex = 3
            case "chapterFive":
                chapterIndex = 4
            case "chapterSix":
                chapterIndex = 5
            default :
                chapterIndex = 0
            }
        }
    }
    
    @State var chapterIndex = 0
    
    private let textWidth = width * 0.88
    private let textPadding = width * 0.12
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.bgColor
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Group{
                    HStack{
                        Text("NIPS")
                            .font(.custom("NuosuSIL-Regular", size: RatioSize.getResWidth(width: 96)))
                            .foregroundColor(.fontColor)
                    }.frame(width: textWidth, alignment: .leading)
                    HStack {
                        Spacer()
                        Text("Hydden")
                            .font(.custom("NuosuSIL-Regular", size: RatioSize.getResWidth(width: 60)))
                            .foregroundColor(.fontColor)
                    }.frame(width: textWidth, alignment: .trailing)
                }
                .frame(width: width)
                .padding(.horizontal, textPadding)
                
                ZStack {
                    HStack {
                        Rectangle()
                            .fill(Color.fontColor)
                            .frame(maxWidth: CGFloat(CGFloat(chapterIndex) * RatioSize.getResWidth(width: 67) + RatioSize.getResWidth(width: 35)), maxHeight: 2)
                        Rectangle()
                            .fill(Color.pastColor)
                            .frame(maxWidth: UIScreen.main.bounds.width - CGFloat(CGFloat(chapterIndex) * RatioSize.getResWidth(width: 67) + RatioSize.getResWidth(width: 35)), maxHeight: 2)
                    }
                    
                    HStack(alignment: .center, spacing: RatioSize.getResWidth(width: 50)) {
                        Spacer()
                        ForEach(0..<6, id: \.self) { index in
                            DotView(circleIndex: index, chapterIndex: chapterIndex)
                        }
                        Spacer()
                    }
                }
                .padding(.top, RatioSize.getResheight(height: 160))
                
                HStack {
                    Spacer()
                    Text("Chapter \(chapterIndex + 1)")
                        .font(.custom("NuosuSIL-Regular", size: RatioSize.getResWidth(width: 24)))
                        .foregroundColor(.fontColor)
                        .padding(.top, RatioSize.getResheight(height: 30))
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("\"낯선 방\"")
                        .font(.custom("NanumMyeongjoBold", size: RatioSize.getResWidth(width: 20)))
                        .foregroundColor(.fontColor)
                    Spacer()
                }
                .padding(.top, RatioSize.getResheight(height: 10))
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("탭해서 시작하기")
                        .font(.custom("Inter-SemiBold", size: RatioSize.getResWidth(width: 20)))
                        .foregroundColor(.tapFontColor)
                        .opacity(tapFontColorOpacity ? 1 : 0)
                        .animation(.linear(duration: 1).repeatForever(), value: tapFontColorOpacity)
                        .onAppear {
                            tapFontColorOpacity.toggle()
                        }
                    Spacer()
                }
                .padding(.bottom, RatioSize.getResheight(height: 60))
            }
            .padding(.top, RatioSize.getResheight(height: 120))
        }
    }
}
