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
    @State private var isHeartOn: [Bool] = [false, false, false, false, false]
    private let lights: [Int] = [0, 1, 2, 3, 4].shuffled()   // 전구 켜지는 순서 저장할 배열
    @State private var switchsunsu: [Int] = []
    
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
                                switchsunsu.append(i)
                            }
                            .padding(.bottom)
                        Image(isHeartOn[i] ? "lightOn" : "lightOff")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                    }
                    .padding(.bottom, 30)
                }
                
            }.padding()
            
            // 스와이프로 레버 손잡이 이미지 변하게하기
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 220)
                .background(.blue)
            /*https://stackoverflow.com/questions/60885532/how-to-detect-swiping-up-down-left-and-right-with-swiftui-on-a-view 위아래좌우 스와이프 구분하는 코드*/
                .gesture(DragGesture(minimumDistance: 100, coordinateSpace: .global)
                    .onEnded { value in
                        let horizontalAmount = value.translation.width as CGFloat
                        let verticalAmount = value.translation.height as CGFloat
                        
                        if abs(horizontalAmount) < abs(verticalAmount) {
                            imageName = verticalAmount < 0 ? "leverOn" : "leverOff"
                        }
                        if lights == switchsunsu {
                            IsGameClear = true
                        }
                        if imageName == "leverOn" && IsGameClear == false {
                            print("lights: \(lights)")
                            print("switchsunsu: \(switchsunsu)")
                            
                            print(IsGameClear)
                            isHeartOn = [false, false, false, false, false]
                            
                            for i in 0...4 {
                                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.7) {
                                    isHeartOn[lights[i]] = true
                                }
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0 * 0.7 + 1) {
                                imageName = "leverOff"
                                switchsunsu = []
                                isHeartOn = [false, false, false, false, false]
                            }
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
