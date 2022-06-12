//
//  ModelData.swift
//  MC2-Team1
//
//  Created by Kim Insub on 2022/05/23.
//

import Foundation
import Combine

// ModelData
final class ModelData: ObservableObject {
    
    //filterPara
    func filterPara(chapter: String, id: Int) -> Paragraph {
        let chapter: [Paragraph] = JsonManager.load("\(chapter).json")
        var filteredPara: Paragraph {
            chapter.filter { paragraph in paragraph.id == id }.first!
        }
        return filteredPara
    }
    
    // pastParas
    @Published var pastParas: [[String]] = JsonManager.load("PastPara.json") {
        didSet {
            currentIndex = pastParas.count
            JsonManager.save(data: pastParas)
        }
    }
    @Published var currentIndex = 0
}
