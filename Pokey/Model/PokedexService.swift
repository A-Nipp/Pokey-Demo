//
//  PokedexService.swift
//  API-Test
//
//  Created by AlecNipp on 10/25/22.
//

import Foundation

 class PokedexService {
    static func getPokedexFromJSON() -> Pokedex? {
        guard let url = Bundle.main.url(forResource: "pokedex-data", withExtension: "json") else {
            return nil
        }
        guard let data = try? JSONDecoder().decode(Pokedex.self, from: Data(contentsOf: url)) else {
            return nil
        }
        
        return data
        
    }
}
