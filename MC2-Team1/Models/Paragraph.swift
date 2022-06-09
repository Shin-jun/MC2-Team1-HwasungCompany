//
//  Paragraph.swift
//  MC2-Team1
//
//  Created by Kim Insub on 2022/05/23.
//

import Foundation

struct Paragraph: Hashable, Codable, Identifiable {
    let id: Int
    let content: String
    let audioName: String?
    let imageName: String?
    let choices: [Choice]?
    let vibrate: String?
    let game: String?
    
    var hasGame: Bool {
        game != nil
    }
    
    var hasVibrate: Bool {
        vibrate != nil
    }
    
    var hasChoices: Bool {
        choices != nil
    }
    
    var hasAudio: Bool {
        audioName != nil
    }
    
    var hasImage: Bool {
        imageName != nil
    }
}

struct Choice: Hashable, Codable {
    let content: String
    let nextParagraphId: Int
    
    var effectB: Int?
    var effectC: Int?
    
    var hasEffect: Bool {
        effectB == nil || effectC == nil ? false : true
    }
}

