//
//  PullLeverGameView.swift
//  MC2-Team1
//
//  Created by Eunbi Han on 2022/06/09.
//

import SwiftUI

struct PullLeverGameView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var IsGameClear = false
    @State private var imageName = "leverOff"
    @State private var isLightOn: [Bool] = [false, false, false, false, false]
    @State private var switchsunsu: [Int] = []
    
    private let lights: [Int] = [0, 1, 2, 3, 4].shuffled()   // 전구 켜지는 순서 랜덤 배열
    private var hapticProperties: [HapticProperty] = [
            HapticProperty(count: 1, interval: [0.07], intensity: [0.25], sharpness: [0.5]),
            HapticProperty(count: 2, interval: [0.2, 0.1], intensity: [0.6,0.6], sharpness: [0.5, 0.5]),
            HapticProperty(count: 4, interval: [0.0, 0.1, 0.05, 0.1], intensity: [0.75, 0.35, 0.6, 0.35], sharpness: [0.5, 0.5, 0.5, 0.5])]
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.wallColor)
                .ignoresSafeArea(.all)

            VStack{
                HStack{
                    ForEach(0..<5){ i in
                        // 스위치 및 해당 스위치의 전구 이미지 생성
                        VStack{
                            Image(isLightOn[i] ? "buttonOn" : "buttonOff")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                                .onTapGesture {
                                    // 스위치 터치 시 isLightOn 값 변경하여 스위치, 전구 이미지 변경
                                    isLightOn[i] = !isLightOn[i]
                                    CustomizeHaptic.instance.haptic(hapticCase: Haptic.dynamic, hapticProperty:hapticProperties[0])
                                    if isLightOn[i] == true{
                                        // 사용자가 스위치 켠 순서 기억
                                        switchsunsu.append(i)
                                    }
                                }
                                .padding(.bottom)
                            
                            Image(isLightOn[i] ? "lightOn" : "lightOff")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                        }
                        .padding(.bottom, 30)
                    }
                    
                }
                    .padding()
                    .onAppear{
                        for i in 0..<lights.count {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 + Double(i+1) * 0.7) {
                                // 순서대로 전구 불빛 켜기
                                isLightOn[lights[i]] = true
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 + Double(lights.count+1) * 0.7) {
                            isLightOn = [false, false, false, false, false]
                        }
                
                    }
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                /*https://stackoverflow.com/questions/60885532/how-to-detect-swiping-up-down-left-and-right-with-swiftui-on-a-view 상하좌우 스와이프 구분하는 코드*/
                    .gesture(DragGesture(minimumDistance: 100, coordinateSpace: .global)
                        .onEnded { value in
                            let horizontalAmount = value.translation.width as CGFloat
                            let verticalAmount = value.translation.height as CGFloat
                            
                            if abs(horizontalAmount) < abs(verticalAmount) {
                                // 위아래 스와이프로 레버 손잡이 이미지 변경
                                imageName = verticalAmount < 0 ? "leverOn" : "leverOff"
                            }
                            if lights == switchsunsu {
                                IsGameClear = true
                                CustomizeHaptic.instance.haptic(hapticCase: Haptic.dynamic, hapticProperty:hapticProperties[1])
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }
                            if imageName == "leverOn" && IsGameClear == false {
                                // 순서 못 맞추면 전구 키는 순서 다시 보여주고 스위치, 레버 리셋
                                CustomizeHaptic.instance.haptic(hapticCase: Haptic.dynamic, hapticProperty:hapticProperties[2])
                                isLightOn = [false, false, false, false, false]
                                
                                for i in 0...4 {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(i+1) * 0.7) {
                                        // 순서대로 전구 불빛 켜기
                                        isLightOn[lights[i]] = true
                                    }
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0 * 0.7 + 1) {
                                    // 불빛 모두 켜진 후에 초기화
                                    imageName = "leverOff"
                                    switchsunsu = []
                                    isLightOn = [false, false, false, false, false]
                                }
                            }
                        })
        
            }.onAppear(perform: CustomizeHaptic.instance.prepareHaptics)
            Rectangle()
                .fill(.black)
                .opacity(0.34)
                .ignoresSafeArea(.all)
        }
        
        
    }
}

struct PullLeverGameView_Previews: PreviewProvider {
    static var previews: some View {
        PullLeverGameView()
    }
}
