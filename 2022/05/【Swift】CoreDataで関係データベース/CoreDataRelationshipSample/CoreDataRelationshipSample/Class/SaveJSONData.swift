//
//  SaveJSONData.swift
//  CoreDataRelationshipSample
//
//  Created by nownaka on 2022/05/13.
//

import Foundation
import SwiftUI

class SaveJsonData {
    private let ope = Bundle.main
    func pokemon() -> [PokemonJSONModel] {
        var result = [PokemonJSONModel]()
        for genNo in 1 ... 8 {
            let jsonObjectArr: [PokemonJSONModel] = ope.decodeJSON("gen\(genNo)-jp.json")
            result.append(contentsOf: jsonObjectArr)
        }
        return result
    }
}

extension Bundle {
    func decodeJSON<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Faild to locate \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded //オブジェクト形式の配列を返す。
    }
}
