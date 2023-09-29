//
//  TextFieldExtension.swift
//  FriendList
//
//  Created by Isaque da Silva on 29/09/23.
//

import SwiftUI

extension TextField where Label : View {
    func fieldStyle() -> some View {
        modifier(FieldModifier())
    }
}
