//
//  Pokemon+CoreDataProperties.swift
//  CoreDataRelationshipSample
//
//  Created by nownaka on 2022/05/13.
//
//

import Foundation
import CoreData


extension Pokemon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pokemon> {
        return NSFetchRequest<Pokemon>(entityName: "Pokemon")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var pokedexNo: Int64
    @NSManaged public var boxNo: Box?

}

extension Pokemon : Identifiable {

}
