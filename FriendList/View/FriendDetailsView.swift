//
//  FriendDetailsView.swift
//  FriendList
//
//  Created by Isaque da Silva on 28/09/23.
//

import SwiftUI

struct FriendDetailsView: View {
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
            
            List {
                Section {
                    Text("Gathering Place:")
                    Text("meetingDate")
                }
            }
            .listStyle(.plain)
             Spacer()
        }
        .navigationTitle("Friend Name")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        FriendDetailsView()
    }
}
