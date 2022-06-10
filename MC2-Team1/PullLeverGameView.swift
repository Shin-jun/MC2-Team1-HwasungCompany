//
//  PullLeverGameView.swift
//  MC2-Team1
//
//  Created by Eunbi Han on 2022/06/09.
//

import SwiftUI

struct PullLeverGameView: View {
    
    @State private var IsGameClear = false
    @State private var imageName = "leverDown"
    @State private var isHeartOn : [Bool] = [false, false, false, false, false]
    
    var body: some View {
        VStack{
            
            HStack{
                // 스위치 이미지 터치 시 불빛 켜지는 이미지로 교체
                ForEach(0..<5){ i in
                    VStack{
                        Image(isHeartOn[i] ? "buttonOn" : "buttonOff")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .onTapGesture {
                                isHeartOn[i] = !isHeartOn[i]
                            }
                        Image(systemName: isHeartOn[i] ? "lightbulb" : "lightbulb.fill")
                            .resizable()
                            .frame(width: 20, height: 30)
                    }
                    .padding(.bottom, 30)
                }
                
            }.padding()
            
            // 스와이프로 레버 손잡이 이미지 변하게하기
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .background(.blue)
            /*https://stackoverflow.com/questions/60885532/how-to-detect-swiping-up-down-left-and-right-with-swiftui-on-a-view*/
                .gesture(DragGesture(minimumDistance: 100, coordinateSpace: .global)
                    .onEnded { value in
                        let horizontalAmount = value.translation.width as CGFloat
                        let verticalAmount = value.translation.height as CGFloat
                        
                        if abs(horizontalAmount) < abs(verticalAmount) {
                            imageName = verticalAmount < 0 ? "leverUp" : "leverDown"
                        }
                    })
        }
        
    }
}

struct PullLeverGameView_Previews: PreviewProvider {
    static var previews: some View {
        PullLeverGameView()
    }
}
