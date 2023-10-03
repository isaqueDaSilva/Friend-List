//
//  NewFriendView.swift
//  FriendList
//
//  Created by Isaque da Silva on 28/09/23.
//

import SwiftUI

struct NewFriendView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: NewFriendViewModel
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.image == nil {
                    Button(action: {
                        viewModel.showingImagePicker = true
                    }, label: {
                        ZStack {
                            Rectangle()
                                .fill(.secondary)
                                .cornerRadius(10)
                            
                            Image(systemName: "square.and.arrow.down")
                                .font(.system(size: 40))
                        }
                    })
                    .frame(width: 250, height: 250)
                    .padding()
                } else {
                    viewModel.image?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                }
                
                Form {
                    Section {
                        TextField("Insert Name:", text: $viewModel.name)
                        TextField("Insert Place:", text: $viewModel.place)
                        DatePicker("Date:", selection: $viewModel.date, in: ...Date.now, displayedComponents: .date)
                    }
                }
            }
            .navigationTitle("New Friend")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button("OK") {
                        viewModel.addNewFriend()
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    })
                }
            }
            .sheet(isPresented: $viewModel.showingImagePicker, content: {
                ImagePicker(image: $viewModel.inputImage)
                    .onChange(of: viewModel.inputImage) { viewModel.loadImage() }
            })
        }
    }
    
    init(onSave: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: NewFriendViewModel(onSave: onSave))
    }
}
