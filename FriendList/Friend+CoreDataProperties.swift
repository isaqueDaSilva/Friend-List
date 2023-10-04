//
//  Friend+CoreDataProperties.swift
//  FriendList
//
//  Created by Isaque da Silva on 04/10/23.
//
//

import Foundation
import CoreData
import UIKit


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var date: Date?
    @NSManaged public var friendPhoto: UIImage?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var place: String?
    @NSManaged public var longitude: Double
    @NSManaged public var latitude: Double
    
    public var unwrappedName: String {
        name ?? "No Name avalible..."
    }
    
    public var unwrappedPlace: String {
        place ?? "No Place avalible..."
    }
    
    public var unwrappedDate: Date {
        date ?? Date.now
    }
}

extension Friend : Identifiable {

}
