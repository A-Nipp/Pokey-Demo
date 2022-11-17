//
//  EvolutionView.swift
//  Pokey
//
//  Created by AlecNipp on 11/16/22.
//

import SwiftUI

struct EvolutionView: View {
    let pokemon: Pokemon
    var body: some View {
        VStack {
            AsyncImage(url: pokemon.imageURL) { image in image
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            Text(pokemon.name)
                .font(.title3)
        }
    }
    
    
}
struct EvolutionView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionView(pokemon: .example)
    }
}
