//
//  Box+CoreDataProperties.swift
//  CoreDataRelationshipSample
//
//  Created by nownaka on 2022/05/12.
//
//

import Foundation
import CoreData


extension Box {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Box> {
        return NSFetchRequest<Box>(entityName: "Box")
    }

    @NSManaged public var boxNo: Int64
    @NSManaged public var name: String
    @NSManaged public var pokemon: NSSet?

}

// MARK: Generated accessors for pokemon
extension Box {

    @objc(addPokemonObject:)
    @NSManaged public func addToPokemon(_ value: Pokemon)

    @objc(removePokemonObject:)
    @NSManaged public func removeFromPokemon(_ value: Pokemon)

    @objc(addPokemon:)
    @NSManaged public func addToPokemon(_ values: NSSet)

    @objc(removePokemon:)
    @NSManaged public func removeFromPokemon(_ values: NSSet)

}

extension Box : Identifiable {

}
