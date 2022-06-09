//
//  BloodExample.swift
//  MC2-Team1
//
//  Created by leejunmo on 2022/06/08.
//

import SwiftUI

// CGPoint ForEach 사용을 위한 Hashable 프로토콜 구현
extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
    UINotificationFeedbackGenerator().notificationOccurred(type)
}

func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    UIImpactFeedbackGenerator(style: style).impactOccurred()
}

struct BloodExample: View {
    @State var bloodShow: Bool = false
    @State var glassShow: Bool = false
    @State var positions: CGPoint = CGPoint()
    @State var firstTouch: Bool = true
    
    var tapGesture: some Gesture {
        // SwiftUI 에서 Tap event 의 position 을 얻기 위해, Drag gesture 을 사용함
        DragGesture(minimumDistance: 0)
            .onChanged { action in
                guard firstTouch else { return }
                
                positions = action.location
                glassShow = true
            }
            .onEnded { _ in
                guard firstTouch else { return }
                
                bloodShow = true
                glassShow = false
                impact(style: .heavy)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
                    bloodShow = false
                }
            }
    }
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
                .gesture(tapGesture)
            if bloodShow {
//                LottieView(name: "blood", loopMode: .playOnce).frame(width: 70, height: 70)
//                    .position(positions)
//                    .onAppear {
//                        withAnimation(.timingCurve(0.37,0.11,1,0.14, duration: 3)) {
//                            positions.y = UIScreen.main.bounds.height
//                        }
//                        // 활성화시 한번만 가능
//                        firstTouch = false
//                    }
            } else {
                Text("Blood Test")
            }
            if glassShow {
                Image("glass").position(positions)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


