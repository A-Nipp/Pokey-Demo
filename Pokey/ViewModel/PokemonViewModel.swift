//
//  PokemonViewModel.swift
//  Pokey
//
//  Created by AlecNipp on 11/16/22.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    var model: Pokemon
    
    init(pokemon: Pokemon) {
        self.model = pokemon
        PokedexService.loadPokedex()
    }
    
    var name: String {
        return model.name
    }
    
    var height: String {
        return model.height
    }
    
    var weight: String {
        return model.weight
    }
    
    var id: Int {
        return model.id
    }
    
    var egg: String {
        return model.egg.rawValue
    }
    
    var number: String {
        return "#" + model.num
    }
        
    var imageURL: URL? {
        let http = model.img
        let https = "https" + http.dropFirst(4)
        return URL(string: https)
    }
    
    var weaknesses: [TypeElement] {
        return model.weaknesses
    }
    
    var nextEvolutions: [Pokemon]? {
        guard let unwrapped = model.nextEvolution else { return nil }
        return unwrapped.map {PokedexService.getPokemonFromNum(num: $0.num)}
        
    }
    
    var prevEvolutions: [Pokemon]? {
        guard let unwrapped = model.prevEvolution else { return nil }
        return unwrapped.map {PokedexService.getPokemonFromNum(num: $0.num)}
    }
    
    var evolutionSeries: [Pokemon] {
        var out = [Pokemon]()
        out.append(model)
        if let prev = prevEvolutions {
            out = prev + out
        }
        if let next = nextEvolutions {
            out += next
        }
        return out
    }
}
