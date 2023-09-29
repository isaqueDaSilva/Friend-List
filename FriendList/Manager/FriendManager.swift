//
//  FriendManager.swift
//  FriendList
//
//  Created by Isaque da Silva on 29/09/23.
//

import Foundation

actor FriendManager {
    static let shared = FriendManager()
    
    var friendsList = [Friend]()
}
