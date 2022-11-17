//
//  PokedexListView.swift
//  Pokey
//
//  Created by AlecNipp on 11/16/22.
//

import SwiftUI

struct PokedexListView: View {
    @StateObject var vm = PokedexViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(vm.pokemon, id: \.num) { pokemon in
                        NavigationLink(destination: PokemonDetailView(vm: PokemonDetailViewModel(pokemon: pokemon))) {
                            PokedexListRowView(pokemon: pokemon)
                                .frame(height: 50)
                            Divider()
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding()
        }
    }
}

struct PokedexListView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexListView()
    }
}
