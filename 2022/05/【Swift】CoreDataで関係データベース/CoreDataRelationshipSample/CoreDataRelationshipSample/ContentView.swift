//
//  ContentView.swift
//  CoreDataRelationshipSample
//
//  Created by nownaka on 2022/05/12.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Box.boxNo, ascending: true)],
        animation: .default)
    private var boxies: FetchedResults<Box>

    var body: some View {
        BoxListView()
            .onAppear(perform: setInitialData)
    }

    private func setInitialData() {
        if boxies.count == 0 {
            for i in 1 ... 15 {
                let newBox = Box(context: viewContext)
                newBox.name = "ボックス\(i)"
                newBox.boxNo = Int64(i)
            }
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
