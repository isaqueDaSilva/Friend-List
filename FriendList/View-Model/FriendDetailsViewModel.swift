//
//  FriendDetailsViewModel.swift
//  FriendList
//
//  Created by Isaque da Silva on 28/09/23.
//

import Foundation
import UIKit

extension FriendDetailsView {
    class FriendDetailsViewModel: ObservableObject {
        let manager = FriendManager.shared
        
        @Published var name: String
        @Published var image: UIImage?
        @Published var place: String
        @Published var date: Date
        @Published var showingDeleteAlert = false
        
        var friend: Friend
        var onSave: () -> Void
        
        func dateFormatter() -> String {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            return formatter.string(from: date)
        }
        
        func delete() {
            Task {
                await manager.delete(friend)
                DispatchQueue.main.async {
                    self.onSave()
                }
            }
        }
        
        init(friend: Friend, onSave: @escaping () -> Void) {
            self.friend = friend
            self.onSave = onSave
            
            _name = Published(initialValue: friend.unwrappedName)
            _image = Published(initialValue: friend.friendPhoto)
            _place = Published(initialValue: friend.unwrappedPlace)
            _date = Published(initialValue: friend.unwrappedDate)
        }
    }
}
