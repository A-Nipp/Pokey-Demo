//
//  PokedexService.swift
//  API-Test
//
//  Created by AlecNipp on 10/25/22.
//

import Foundation

class PokedexService {
    
    static var pokedex: Pokedex? = nil
    
    static func loadPokedex() {
        PokedexService.pokedex = getPokedexFromJSON()
    }
    
    static func getPokedexFromJSON() -> Pokedex? {
        guard let url = Bundle.main.url(forResource: "pokedex-data", withExtension: "json") else {
            return nil
        }
        guard let data = try? JSONDecoder().decode(Pokedex.self, from: Data(contentsOf: url)) else {
            return nil
        }
        
        return data
        
    }
    
    static func getPokemonFromNum(num: String) -> Pokemon {
        return pokedex!.pokemon.first(where: {$0.num == num})!
    }
    
}
