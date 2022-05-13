//
//  BackgroundColorView.swift
//  CoreDataRelationshipSample
//
//  Created by nownaka on 2022/05/13.
//

import SwiftUI

@ViewBuilder
func searchBar(_ placeholder: String, text: Binding<String>) -> some View {
    ZStack {
        RoundedRectangle(cornerRadius: 8)
            .frame(height: 50)
            .foregroundColor(Color("Cell"))
        TextField(placeholder, text: text)
            .padding(.horizontal)
    }
    .padding(.horizontal)
}

@ViewBuilder
func backgroundColor() -> some View {
    Color("Background")
        .ignoresSafeArea()
}

@ViewBuilder
func PokemonSmallPanel(dexNo: Int, name: String, colorScheme: ColorScheme) -> some View {
    ZStack {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color("Cell"))
        VStack {
            Text("No.\(String(format: "%03d", dexNo))")
            Image("icon/generation-viii/front/default/\(dexNo)")
            Text(name)
        }
        .foregroundColor(colorScheme == .dark ? .white : .black)
        .padding(.vertical)
    }
}

@ViewBuilder
func PokemonLargePanel(dexNo: Int, name: String) -> some View {
    ZStack {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color("Cell"))
            //.frame(width: 200, height: 250)
        VStack {
            Text("No.\(String(format: "%03d", dexNo))")
                .font(.title3)
                .padding()
            Image("other/officialArtWork/\(dexNo)")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(name)
                .font(.title3)
                .padding()
        }
    }
    .frame(width: 200, height: 250)
}

@ViewBuilder
func buttonLabel(_ label: String, color: Color, scheme: ColorScheme) -> some View {
    ZStack {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(color)
            .frame(width: 250, height: 50)
        Text(label)
            .bold()
            .foregroundColor(scheme == .dark ? .black : .white)
    }
}


