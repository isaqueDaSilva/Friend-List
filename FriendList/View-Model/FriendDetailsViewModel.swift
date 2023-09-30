//
//  FriendDetailsViewModel.swift
//  FriendList
//
//  Created by Isaque da Silva on 28/09/23.
//

import Foundation

extension FriendDetailsView {
    class FriendDetailsViewModel: ObservableObject {
        @Published var name: String
        @Published var place: String
        @Published var date: Date
        
        func dateFormatter() -> String {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            return formatter.string(from: date)
        }
        
        init(friend: Friend) {
            _name = Published(initialValue: friend.name)
            _place = Published(initialValue: friend.place)
            _date = Published(initialValue: friend.date)
        }
    }
}
