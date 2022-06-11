//
//  HapticTest.swift
//  MC2-Team1
//
//  Created by 황정현 on 2022/06/11.
//

import SwiftUI

struct CustomHapticTestView: View {
    
    private var hapticProperty: HapticProperty = HapticProperty(count: 2, interval: [0.0, 0.1], intensity: [0.65, 0.3], sharpness: [0.85, 0.3])
    
    //https://apps.apple.com/us/app/interactful/id1528095640
    var body: some View {
        VStack {
            Button(action: {
                CustomizeHaptic.instance.haptic(hapticCase: Haptic.transient, hapticProperty:hapticProperty)
            }) {
                Text("Transient Haptic")
                    .foregroundColor(Color.red)
            }.frame(height: height * 0.25)
            
            Button(action: {
                CustomizeHaptic.instance.haptic(hapticCase: Haptic.continuous, hapticProperty:hapticProperty)
            }) {
                Text("Continuous Haptic")
            }.frame(height: height * 0.25)
            
            Button(action: {
                CustomizeHaptic.instance.haptic(hapticCase: Haptic.dynamic, hapticProperty:hapticProperty)
            }) {
                Text("Dynamic Haptic")
                    .foregroundColor(Color.green)
            }.frame(height: height * 0.25)
            
        }.onAppear(perform: CustomizeHaptic.instance.prepareHaptics)
    }
}

struct CustomHapticTestView_Previews: PreviewProvider {
    static var previews: some View {
        CustomHapticTestView()
    }
}
