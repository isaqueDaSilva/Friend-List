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
            Task { @MainActor in
                await manager.fetchFriends()
                friends = await manager.friendList
            }
        }
        
        func delete(_ indexSet: IndexSet) {
            Task {
                guard let index = indexSet.first else { return }
                let friend = friends[index]
                await manager.delete(friend)
            }
        }
        
        init() {
            getFriendList()
        }
    }
}
