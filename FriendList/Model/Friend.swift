//
//  Friend.swift
//  FriendList
//
//  Created by Isaque da Silva on 28/09/23.
//

import Foundation

struct Friend: Identifiable {
    let id = UUID()
    let name: String
    let gatheringPlace: String
    let meetingDate: Date
}
