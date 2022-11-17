//
//  PokemonDetailView.swift
//  Pokey
//
//  Created by AlecNipp on 11/16/22.
//

import SwiftUI

struct PokemonDetailView: View {
    @StateObject var vm: PokemonDetailViewModel
    var body: some View {
        ZStack {
            BackgroundColor()
            VStack {
                title
                pokemonImage
                    .padding(.horizontal, 50)
                summary
                    .padding(.bottom)
                    .padding(.horizontal)
                evolutions
                    .padding(.horizontal)
                
            }
            
        }
    }
    
    
    var title: some View {
        HStack {
            Text(vm.name)
            Text(vm.number)
        }
        .font(.largeTitle)
    }
    
    var pokemonImage: some View {
        AsyncImage(url: vm.imageURL) { image in image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
    
    var summary: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Height")
                    .bold()
                Text(vm.height)
                Text("Weight")
                    .bold()
                Text(vm.weight)
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("Type")
                    .bold()
                HStack {
                    ForEach(vm.model.type, id: \.rawValue) { type in
                        Text(type.rawValue)
                    }
                }
                Text("Weaknesses")
                    .bold()
                HStack {
                    ForEach(vm.weaknesses, id: \.rawValue) { type in
                        Text(type.rawValue)
                    }
                }
            }
            
            
        }
    }
    
    @ViewBuilder
    var evolutions: some View {
        Text("Evolutions")
            .font(.title2)
        HStack(alignment: .top) {
            ForEach(vm.evolutionSeries, id: \.num) { pokemon in
                Button {
                    vm.model = pokemon
                } label: {
                    EvolutionView(pokemon: pokemon)
                }
                .buttonStyle(.plain)
            }
        }
    }
    
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(vm: PokemonDetailViewModel(pokemon: .example))
    }
}





