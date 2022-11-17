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
            } placeholder: {
                ProgressView()
            }
            .padding()
            .background(Color.white, in: Circle())
            
            Text(pokemon.name)
                .font(.title3)
        }
    }
    
    
}
struct EvolutionView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.yellow
                .opacity(0.2)
                .ignoresSafeArea()
            EvolutionView(pokemon: .example)
        }
    }
}
