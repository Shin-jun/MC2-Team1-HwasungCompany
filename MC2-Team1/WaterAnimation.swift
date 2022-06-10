//
//  WaterAnimation.swift
//  MC2-Team1
//
//  Created by 황정현 on 2022/06/09.
//

import SwiftUI

let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height

struct WaterAnimation: View {
    
    let targetTouchCount = 5
    
    @State var playerTouchCount: Int = 0
    @State var waterTankBroken: Bool = false
    @State var hurt: Bool = false

    @State var bloodShow: Bool = false
    @State var glassShow: Bool = false
    @State var positions: CGPoint = CGPoint(x:width * 0.5, y: height * 0.5)
    @State var firstTouch: Bool = true
    
//    var tapGesture: some Gesture {
//        // SwiftUI 에서 Tap event 의 position 을 얻기 위해, Drag gesture 을 사용함
//        DragGesture(minimumDistance: 0)
//            .onChanged { action in
//                guard firstTouch else { return }
//
//                //positions = action.location
//                glassShow = true
//            }
//            .onEnded { _ in
//                guard firstTouch else { return }
//
//                bloodShow = true
//                glassShow = false
//                impact(style: .heavy)
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
//                    bloodShow = false
//                }
//            }
//    }

    var body: some View {
        
        ZStack {
//            Color(.white)
//                .ignoresSafeArea()
//                .gesture(tapGesture)
            ZStack {
                if(hurt == false) {
                    Image("Card")
                        .resizable()
                        .frame(width: width * 0.7, height: width * 0.7)
                        .foregroundColor(Color.red)
                } else {
                    Image("Card_Blood")
                        .resizable()
                        .frame(width: width * 0.7, height: width * 0.7)
                        .foregroundColor(Color.red)
                }
                if bloodShow {
                    ZStack {
                        //https://stackoverflow.com/questions/57342170/how-do-i-set-the-size-of-a-sf-symbol-in-swiftui
                        Image(systemName: "drop.fill")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundColor(Color.blood)
                    }
                        .position(positions)
                        .onAppear {
                            withAnimation(.timingCurve(1,0.28,0.72,0.96, duration: 1.0)) {
                            //withAnimation(.timingCurve(0.36,0.86,0.92,0.57, duration: 1.0)) {
                            //withAnimation(.timingCurve(0.36,0.86,1,0.71, duration: 1.5)) {
                                positions.x = width * 0.5
                                positions.y = height * 1.1
                            }
                            // 활성화시 한번만 가능
                            firstTouch = false
                        }
                }
            }
            if(playerTouchCount < targetTouchCount)
            {
                Image("Glass\(playerTouchCount)")
                    .resizable()
                    .frame(width: width, height: height, alignment: .center)
            }
        }.frame(width: width, height: height)
        .onTapGesture {
            playerTouchCount += 1
            if(playerTouchCount == targetTouchCount - 1)
            {
                HapticManager.instance.notification(type: .error)
                waterTankBroken = true
                print("Water Tank Broken!")
            } else if (playerTouchCount == targetTouchCount){
                HapticManager.instance.notification(type: .success)
                hurt = true
                bloodShow = true
            } else if (playerTouchCount < targetTouchCount - 1){
                HapticManager.instance.impact(style: .heavy)
            }
        }
    }
}

struct WaterAnimation_Previews: PreviewProvider {
    static var previews: some View {
        WaterAnimation()
    }
}
