//
//  FieldModifier.swift
//  FriendList
//
//  Created by Isaque da Silva on 29/09/23.
//

import SwiftUI

struct FieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(.black.opacity(0.05))
            .cornerRadius(10)
    }
}

