//
//  BoxListView.swift
//  CoreDataRelationshipSample
//
//  Created by nownaka on 2022/05/12.
//

import SwiftUI

struct BoxListView: View {
    @Environment(\.colorScheme) private var colorScheme
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Box.boxNo, ascending: true)],
        animation: .default)
    private var boxies: FetchedResults<Box>

    private let grids = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    private let colors: [Color] = [.red, .orange, .blue, .brown, .cyan, .green, .indigo, .mint, .pink]

    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor()
                ScrollView {
                    LazyVGrid(columns: grids, spacing: 15) {
                        ForEach(boxies) { box in
                            NavigationLink(destination: BoxView(box: box)) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(height: 100)
                                        .foregroundColor(colors.randomElement())
                                    VStack {
                                        Text("\(box.name)")
                                            .font(.title3)
                                        if let num = box.pokemon?.allObjects.count {
                                            Text("\(num)匹")
                                        } else {
                                            Text("0匹")
                                        }
                                    }
                                    .foregroundColor(colorScheme == .dark ? .black : .white)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AllPokemonListView()) {
                            Image(systemName: "plus")
                        }
                    }
                }
                .navigationTitle("ボックス一覧")
            }
        }
    }
}

struct BoxListView_Previews: PreviewProvider {
    static var previews: some View {
        BoxListView()
    }
}
