//
//  BoxView.swift
//  CoreDataRelationshipSample
//
//  Created by nownaka on 2022/05/12.
//

import SwiftUI

struct BoxView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var searchKey = ""
    private let grids = Array(repeating: GridItem(.flexible(), spacing: 15, alignment: .center), count: 3)
    let box: Box

    var body: some View {
        ZStack {
            backgroundColor()
            VStack {
                searchBar("ポケモン名 or 図鑑No", text: $searchKey)

                Divider()
                    .padding(.vertical, 10.0)

                ScrollView {
                    LazyVGrid(columns: grids) {
                        ForEach(searchPokemons) { pokemon in
                            NavigationLink(destination: EditPokemonView(pokemon: pokemon)) {
                                PokemonSmallPanel(dexNo: Int(pokemon.pokedexNo), name: pokemon.name, colorScheme: colorScheme)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle(box.name)
        }
    }

    private var pokemons: [Pokemon] {
        if let pokemons = box.pokemon?.allObjects as? [Pokemon] {
            return pokemons
        } else {
            return [Pokemon]()
        }
    }

    private var searchPokemons: [Pokemon] {
        if searchKey.isEmpty {
            return pokemons
        } else if let no = Int(searchKey) {
            return pokemons.filter{ $0.pokedexNo == no && $0.pokedexNo < 898 }
        } else {
            return pokemons.filter{ $0.name.contains(searchKey) }.filter{ $0.pokedexNo < 898 }
        }
    }
}
