//
//  NewFriendViewModel.swift
//  FriendList
//
//  Created by Isaque da Silva on 29/09/23.
//

import Foundation

extension NewFriendView {
    class NewFriendViewModel: ObservableObject {
        let manager = FriendManager.shared
        
        @Published var name = ""
        @Published var place = ""
        @Published var date = Date.now
    }
}
