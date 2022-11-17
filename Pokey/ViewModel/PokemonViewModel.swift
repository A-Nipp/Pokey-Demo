//
//  PokemonViewModel.swift
//  Pokey
//
//  Created by AlecNipp on 11/16/22.
//

import Foundation

/// The ViewModel for a PokemonDetailView. It has one Published property, which is the model of the Pokemon currently in the view.
class PokemonDetailViewModel: ObservableObject {
    /// Tracks the Pokemon in the view currently. Note that this property can be changed.
    @Published var model: Pokemon
    
    init(pokemon: Pokemon) {
        self.model = pokemon
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
        return model.imageURL
    }
    
    var weaknesses: [TypeElement] {
        return model.weaknesses
    }
    
    var nextEvolutions: [Pokemon]? {
        guard let unwrapped = model.nextEvolution else { return nil }
        return unwrapped.map {PokedexService.shared.getPokemonFromNum(num: $0.num)}
        
    }
    
    var prevEvolutions: [Pokemon]? {
        guard let unwrapped = model.prevEvolution else { return nil }
        return unwrapped.map {PokedexService.shared.getPokemonFromNum(num: $0.num)}
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
