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
    
    // pastParas
    @Published var pastParas = [
        "새로운 사람을 발견한 기쁨도 잠시였다. 만약 저 자가 사람을 죽인 범인이라면 어떡하지?",
        "긴장한 나머지 손에서 문고리가 미끄러지면서 문이 열렸다.",
        "비릿한 향을 따라 시선이 차츰 옮겨졌다.",
        "손을 씻고 있던 움직임이 멎고 반절 이상 열린 문을 경계로 뒤돌아선 그 자와 나의 눈이 마주쳤다.",
        "나는 뒤로 주춤거리며 물러섰다. 다른 곳으로 나갈 만한 문은 보이지 않았다",
        "\"죽은 줄만 알았는데 살아 계셨군요! 다행입니다. 어디 아프신 곳은 없으신가요?\"",
        "피를 흘린 채 쓰러져 있는 사람 하나가 방의 어느 구석에 있었다.",
        "마치 걱정했다는 듯한 얼굴로 말했다. 그는 세면대 옆의 수건에 아무렇지 않게 손을 닦으며 말했다.",
        "비릿한 향을 따라 시선이 차츰 옮겨졌다. 피를 흘린 채 쓰러져 있는 사람 하나가 방의 어느 구석에 있었다.",
        "텍스트만 있는 경우 하나의 책같은 느낌이다. 버튼이 좀 더  직관적으로 선택이 가능하다고 느껴진다.",
        "속이 울렁거렸다.",
        "글씨만 있는 경우 구분선이 있더라도 누른다는 인지를 못할 것 같다."
    ] {
        didSet {
            currentIndex = pastParas.count - 1
        }
    }
    @Published var currentIndex = 0
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
