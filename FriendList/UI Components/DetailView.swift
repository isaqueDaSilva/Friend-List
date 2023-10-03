//
//  DetailView.swift
//  FriendList
//
//  Created by Isaque da Silva on 02/10/23.
//

import SwiftUI

struct DetailView: View {
    var title: String
    var description: String
    var body: some View {
        HStack {
            Text(title)
                .bold()
            Spacer()
            Text(description)
                .bold()
                .foregroundColor(.gray)
        }
    }
}
