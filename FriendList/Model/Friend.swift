//
//  Friend.swift
//  FriendList
//
//  Created by Isaque da Silva on 28/09/23.
//

import Foundation
import SwiftUI

struct Friend: Codable, Identifiable {
    let id = UUID()
    let name: String
    let friendPhoto: UIImage
    let place: String
    let date: Date
}
