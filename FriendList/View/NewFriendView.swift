//
//  NewFriendView.swift
//  FriendList
//
//  Created by Isaque da Silva on 28/09/23.
//

import SwiftUI

struct NewFriendView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = NewFriendViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    
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
                
                VStack {
                    TextField("Insert Name:", text: $viewModel.name)
                        .fieldStyle()
                    TextField("Insert Place:", text: $viewModel.place)
                        .fieldStyle()
                    DatePicker("Date:", selection: $viewModel.date, in: ...Date.now, displayedComponents: .date)
                        .dataPickerStyle()
                }
                .padding()
                Spacer()
            }
            .navigationTitle("New Friend")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button("OK") {
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
        }
    }
}

#Preview {
    NavigationView {
        NewFriendView()
    }
}
