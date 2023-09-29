//
//  FriendListViewModel.swift
//  FriendList
//
//  Created by Isaque da Silva on 28/09/23.
//

import Foundation

extension FriendListView {
    class FriendListViewModel: ObservableObject {
        let manager = FriendManager.shared
        
        @Published var friends = [Friend]()
        @Published var showingAddNewFriend: Bool = false
        
        func getFriendList() {
            Task {
                self.friends = await manager.friendsList
            }
        }
        
        init() {
            getFriendList()
        }
    }
}
