//
//  NewFriendViewModel.swift
//  FriendList
//
//  Created by Isaque da Silva on 29/09/23.
//

import Foundation
import SwiftUI

extension NewFriendView {
    class NewFriendViewModel: ObservableObject {
        let manager = FriendManager.shared
        
        @Published var name = ""
        @Published var place = ""
        @Published var date = Date.now
        @Published var image: Image?
        @Published var inputImage: UIImage?
        @Published var showingImagePicker = false
        
        func loadImage() {
            guard let inputImage = inputImage else { return }
            
            self.image = Image(uiImage: inputImage)
        }
    }
}
