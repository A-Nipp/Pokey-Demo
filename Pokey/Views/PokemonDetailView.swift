//
//  PokemonDetailView.swift
//  Pokey
//
//  Created by AlecNipp on 11/16/22.
//

import SwiftUI

struct PokemonDetailView: View {
    @StateObject var vm =  PokemonDetailViewModel(pokemon: .example)
    var body: some View {
        ZStack {
            Color.yellow
                .opacity(0.2)
                .ignoresSafeArea()
            VStack {
                title
                pokemonImage
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
                .padding()
                
            }
        }
    }
    
    @ViewBuilder
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
    
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView()
    }
}


