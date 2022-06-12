//
//  Constants.swift
//  MC2-Team1
//
//  Created by 황정현 on 2022/06/10.
//

import Foundation
import SwiftUI

let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height

struct RatioSize {
    static func getResWidth(width: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.width * (width/428)
    }

    static func getResheight(height: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.height * (height/926)
    }
}
