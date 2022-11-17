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
        GeometryReader { geo in
            ZStack {
                BackgroundColor()
                VStack {
                    title
                    HStack {
                        pokemonImage
                            .frame(width: geo.size.width / 2)
                        summary
                            .padding(.bottom)
                            .padding(.horizontal)
                    }
                    
                    evolutions
                        .padding(.horizontal)
                    
                }
                
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
            VStack(alignment: .leading, spacing: 10) {
                Text("Height")
                    .bold()
                Text(vm.height)
                Text("Weight")
                    .bold()
                Text(vm.weight)
                Text("Type")
                    .bold()
                HStack {
                    ForEach(vm.model.type, id: \.rawValue) { type in
                        Text(type.rawValue)
                    }
                }
                Text("Weaknesses")
                    .bold()
                LazyVGrid(columns: [GridItem(alignment: .leading), GridItem(alignment: .leading)], spacing: 5) {
                    ForEach(vm.weaknesses, id: \.rawValue) { type in
                        Text(type.rawValue)
                    }
                }
                
                
            }
            Spacer()
            VStack(alignment: .leading) {
                
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





