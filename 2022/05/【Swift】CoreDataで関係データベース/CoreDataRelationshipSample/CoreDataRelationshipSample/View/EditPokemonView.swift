//
//  EditPokemonView.swift
//  CoreDataRelationshipSample
//
//  Created by nownaka on 2022/05/13.
//

import SwiftUI

struct EditPokemonView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Box.boxNo, ascending: true)],
        animation: .default)
    private var boxies: FetchedResults<Box>
    @State private var boxNo: Box?
    let pokemon: Pokemon

    var body: some View {
        ZStack {
            backgroundColor()
            ZStack {
                VStack {
                    PokemonLargePanel(dexNo: Int(pokemon.pokedexNo), name: pokemon.name)

                    Picker("預けるボックス", selection: $boxNo) {
                        ForEach(boxies) { box in
                            Text(box.name).tag(Box?.some(box))
                        }
                    }
                    .padding()

                    Button(action: saveCoreData) {
                        buttonLabel("保存", color: .orange, scheme: colorScheme)
                    }
                    .padding()

                    Button(action: deleteCoreData) {
                        buttonLabel("逃がす", color: .red, scheme: colorScheme)
                    }
                    .padding()
                }
            }
            .navigationTitle("詳細")
        }
    }

    private func saveCoreData() {
        do {
            pokemon.boxNo = boxNo
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    private func deleteCoreData() {
        viewContext.delete(pokemon)
    }
}

//struct EditPokemonView_Previews: PreviewProvider {
//    static let pokemon = PokemonJSONModel(no: 196, name: "エーフィ")
//    static var previews: some View {
//        EditPokemonView(pokemon: pokemon)
//    }
//}
