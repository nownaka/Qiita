//
//  CoreDataRelationshipSampleApp.swift
//  CoreDataRelationshipSample
//
//  Created by nownaka on 2022/05/12.
//

import SwiftUI

@main
struct CoreDataRelationshipSampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
