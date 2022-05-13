//
//  AllPokemonListView.swift
//  CoreDataRelationshipSample
//
//  Created by nownaka on 2022/05/13.
//

import SwiftUI

struct AllPokemonListView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var searchKey = ""
    private let grids = Array(repeating: GridItem(.flexible(), spacing: 15, alignment: .center), count: 3)
    let pokemons = SaveJsonData().pokemon()
    
    var body: some View {
        ZStack {
            backgroundColor()
            VStack {
                searchBar("ポケモン名 or 図鑑No", text: $searchKey)

                Divider()
                    .padding(.vertical, 10.0)

                ScrollView {
                    LazyVGrid(columns: grids, spacing: 15) {
                        ForEach(searchPokemons.indices, id: \.self) { index in
                            NavigationLink(destination: RegistPokemonView(pokemon: searchPokemons[index])) {
                                PokemonSmallPanel(dexNo: searchPokemons[index].no, name: searchPokemons[index].name, colorScheme: colorScheme)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("預ける")
    }

    private var searchPokemons: [PokemonJSONModel] {
        if searchKey.isEmpty {
            return pokemons.sorted{ $0.no < $1.no }.filter{ $0.no < 898 }
        } else if let no = Int(searchKey) {
            return pokemons.filter{ $0.no == no && $0.no < 898 }
        } else {
            return pokemons.filter{ $0.name.contains(searchKey) }.filter{ $0.no < 898 }
        }
    }
}

struct AllPokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AllPokemonListView()
        }
    }
}
