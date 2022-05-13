//
//  RegistPokemon.swift
//  CoreDataRelationshipSample
//
//  Created by nownaka on 2022/05/13.
//

import SwiftUI

struct RegistPokemonView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Box.boxNo, ascending: true)],
        animation: .default)
    private var boxies: FetchedResults<Box>
    @State var box: Box?
    let pokemon: PokemonJSONModel
    
    var body: some View {
        ZStack {
            backgroundColor()
            ZStack {
                VStack {
                    PokemonLargePanel(dexNo: pokemon.no, name: pokemon.name)

                    Picker("預けるボックス", selection: $box) {
                        Text("ボックスを選択").tag(Box?.none)
                        ForEach(boxies) { box in
                            Text(box.name).tag(Box?.some(box))
                        }
                    }
                    .padding()
                    
                    Button(action: saveCoreData) {
                        buttonLabel("預ける", color: .orange, scheme: colorScheme)
                    }
                }
            }
        }
        .navigationTitle("ボックス選択")
    }
    
    private func saveCoreData() {
        if let box = box {
            let newPokemon = Pokemon(context: viewContext)
            newPokemon.id = UUID()
            newPokemon.name = pokemon.name
            newPokemon.pokedexNo = Int64(pokemon.no)
            newPokemon.boxNo = box
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct RegistPokemonView_Previews: PreviewProvider {
    static let pokemon = PokemonJSONModel(no: 196, name: "エーフィ")
    static var previews: some View {
        RegistPokemonView(pokemon: pokemon)
    }
}
