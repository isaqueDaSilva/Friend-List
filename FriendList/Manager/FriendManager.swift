//
//  FriendManager.swift
//  FriendList
//
//  Created by Isaque da Silva on 29/09/23.
//

import CoreData
import Foundation

actor FriendManager {
    static let shared = FriendManager()
    
    let conteiner: NSPersistentContainer
    let context: NSManagedObjectContext
    
    var friendList = [Friend]()
    
    func fetchFriends() {
        let request = NSFetchRequest<Friend>(entityName: "Friend")
        
        do {
            friendList = try context.fetch(request)
        } catch let error {
            print("Falied to loading Friend List. Error: \(error)")
        }
    }
    
    private func save() {
        do {
            try context.save()
            fetchFriends()
        } catch let error {
            print("Falied to save a new Friend in Friend List. Error: \(error)")
        }
    }
    
    func addNewFriend(_ friend: Friend) {
        friendList.append(friend)
        save()
    }
    
    func delete(_ friend: Friend) {
        context.delete(friend)
        save()
    }
    
    private init() {
        self.conteiner = NSPersistentContainer(name: "FriendModel")
        self.context = self.conteiner.viewContext
        
        self.conteiner.loadPersistentStores { (description, error) in
            if error != nil {
                print("Falied to loading Friend List.")
            }
        }
        self.context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
}
