//
//  WaterAnimation.swift
//  MC2-Team1
//
//  Created by 황정현 on 2022/06/09.
//

import SwiftUI

struct GlassAnimationView: View {
    @Environment(\.presentationMode) var presentationMode
    
    private let targetTouchCount = 3
    private let customHaptics: [HapticProperty] = [
        HapticProperty(count: 2, interval: [0.0, 0.1], intensity: [0.25, 0.3], sharpness: [0.85, 0.3]),
        HapticProperty(count: 2, interval: [0.0, 0.1], intensity: [0.55, 0.3], sharpness: [0.85, 0.3]),
        HapticProperty(count: 2, interval: [0.0, 0.1], intensity: [0.75, 0.3], sharpness: [0.85, 0.3])]
    
    @State private var playerTouchCount: Int = 0
    @State private var glassBroken: Bool = false
    
    @State private var positions: CGPoint = CGPoint(x:width * 0.5, y: height * 0.5)
    
    var body: some View {
        
        ZStack {
            ZStack {
                if (glassBroken == false) {
                    Image("Card")
                        .resizable()
                        .frame(width: width * 0.7, height: width * 0.7)
                } else {
                    Image("Card_Blood")
                        .resizable()
                        .frame(width: width * 0.7, height: width * 0.7)
                }
                if glassBroken {
                    ZStack {
                        //https://stackoverflow.com/questions/57342170/how-do-i-set-the-size-of-a-sf-symbol-in-swiftui
                        Image(systemName: "drop.fill")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundColor(Color.blood)
                    }
                    .position(positions)
                    .onAppear {
                        withAnimation(.timingCurve(1,0.28,0.72,0.96, duration: 1.0)) {
                            positions.x = width * 0.5
                            positions.y = height * 1.1
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
            if (playerTouchCount <= targetTouchCount)
            {
                Image("Glass\(playerTouchCount)")
                    .resizable()
                    .frame(width: width, height: height, alignment: .center)
            }
        }.frame(width: width, height: height)
            .onAppear(perform: CustomizeHaptic.instance.prepareHaptics)
            .onTapGesture {
                if (playerTouchCount == targetTouchCount) {
                    HapticManager.haptic(type: .error)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                        HapticManager.haptic(type: .success)
                    }
                    glassBroken = true
                } else if (playerTouchCount < targetTouchCount) {
                    CustomizeHaptic.instance.haptic(hapticCase: Haptic.continuous, hapticProperty:customHaptics[playerTouchCount])
                }
                playerTouchCount += 1
            }
    }
}

struct GlassAnimation_Previews: PreviewProvider {
    static var previews: some View {
        GlassAnimationView()
    }
}
