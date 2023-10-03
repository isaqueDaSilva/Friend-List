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
        
        var onSave: () -> Void
        
        func loadImage() {
            guard let inputImage = inputImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: inputImage)
            }
        }
        
        func addNewFriend() {
            Task {
                let newFriend = Friend(context: manager.context)
                newFriend.id = UUID()
                newFriend.name = self.name
                newFriend.friendPhoto = self.inputImage
                newFriend.place = self.place
                newFriend.date = self.date
                await manager.save()
                DispatchQueue.main.async {
                    self.onSave()
                }
            }
        }
        
        init(onSave: @escaping () -> Void) {
            self.onSave = onSave
        }
    }
}
