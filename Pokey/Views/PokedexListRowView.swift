//
//  PokedexListRowView.swift
//  Pokey
//
//  Created by AlecNipp on 11/16/22.
//

import SwiftUI

struct PokedexListRowView: View {
    let pokemon: Pokemon
    var body: some View {
        HStack {
            AsyncImage(url: pokemon.imageURL) { image in image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
                    .frame(height:50)
            }
            Text(pokemon.num)
            Text(pokemon.name)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.black)
        }
        .font(.custom("PKMN-RBYGSC", size: 20, relativeTo: .title2))
    }
}

struct PokedexListRowView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexListRowView(pokemon: .example)
            .frame(height: 60)
    }
}
