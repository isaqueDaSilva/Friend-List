//
//  DataPickerExtension.swift
//  FriendList
//
//  Created by Isaque da Silva on 29/09/23.
//

import SwiftUI

extension DatePicker where Label : View {
    func dataPickerStyle() -> some View {
        modifier(FieldModifier())
    }
}
