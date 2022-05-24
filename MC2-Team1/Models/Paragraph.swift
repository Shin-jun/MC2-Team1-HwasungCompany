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
    
    func hasChoices() -> Bool {
        return self.choices == nil ? false : true
    }
    
    func hasAudio() -> Bool {
        return self.audioName == nil ? false : true
    }
    
    func hasImage() -> Bool {
        return self.imageName == nil ? false : true
    }
}

struct Choice: Hashable, Codable {
    let content: String
    let nextParagraphId: Int
}
