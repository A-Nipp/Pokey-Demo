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
        return model.weaknesses ?? []
    }
}
