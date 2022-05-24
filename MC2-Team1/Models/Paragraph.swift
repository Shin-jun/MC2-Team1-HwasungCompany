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
    let choices: [String:Int]?
    
    func isChoices() -> Bool {
        if self.choices == nil{
            return false
        } else {
            return true
        }
    }

    func isAudio() -> Bool{
        if self.audioName == nil {
            return false
        } else {
            return true
        }
    }
    
    func isImage() -> Bool{
        if self.imageName == nil {
            return false
        } else {
            return true
        }
    }
}
