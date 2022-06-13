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
    let choices: [Choice]?
    let isForkedParagraph: Bool?
    let game: String?
    
    var hasGame: Bool {
        game != nil
    }
    
    var hasChoices: Bool {
        choices != nil
    }
}

struct Choice: Hashable, Codable {
    let content: String
    let nextParagraphId: Int
    
    let effectB: Int?
    let effectC: Int?
    
    let nextChapterIndex: Int?
    
    var hasEffect: Bool {
        effectB == nil || effectC == nil ? false : true
    }
}

