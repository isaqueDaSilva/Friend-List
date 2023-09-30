//
//  FriendDetailsView.swift
//  FriendList
//
//  Created by Isaque da Silva on 28/09/23.
//

import SwiftUI

struct FriendDetailsView: View {
    @StateObject var viewModel: FriendDetailsViewModel
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(.secondary)
                    .cornerRadius(10)
                
                Image(systemName: "square.and.arrow.down")
                    .font(.system(size: 40))
            }
            .frame(width: 250, height: 250)
            .padding()
            
            Text(viewModel.place)
                .fieldStyle()
            Text(viewModel.dateFormatter())
                .fieldStyle()
             Spacer()
        }
        .navigationTitle(viewModel.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    init(friend: Friend) {
        _viewModel = StateObject(wrappedValue: FriendDetailsViewModel(friend: friend))
    }
}
