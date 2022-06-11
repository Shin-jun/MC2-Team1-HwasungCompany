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
        let chapter: [Paragraph] = load("\(chapter).json")
        var filteredPara: Paragraph {
            chapter.filter { paragraph in paragraph.id == id }.first!
        }
        return filteredPara
    }
}

// load JSON
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
