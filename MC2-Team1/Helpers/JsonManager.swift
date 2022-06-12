//
//  JsonManager.swift
//  MC2-Team1
//
//  Created by peo on 2022/06/12.
//

import Foundation

final class JsonManager {
    static func load<T: Decodable>(_ filename: String) -> T {
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
    
    static func save<T: Codable>(data: [T]) {
        let jsonEncoder = JSONEncoder()
        
        guard let file = Bundle.main.url(forResource: "PastPara.json", withExtension: nil)
        else {
            fatalError("Couldn't find memoData.json in main bundle.")
        }
        
        do {
            let encodedData = try jsonEncoder.encode(data)
            
            do {
                try encodedData.write(to: file.standardizedFileURL)
            }
            catch let error as NSError {
                print(error)
            }
        } catch {
            print(error)
        }
    }
}
