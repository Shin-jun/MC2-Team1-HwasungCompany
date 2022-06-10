//
//  HapticManager.swift
//  MC2-Team1
//
//  Created by 황정현 on 2022/06/09.
//

import SwiftUI

class HapticManager {
    
    static func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
        UINotificationFeedbackGenerator().notificationOccurred(type)
    }

    static func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        UIImpactFeedbackGenerator(style: style).impactOccurred()
    }

}
