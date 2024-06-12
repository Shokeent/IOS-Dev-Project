//
//  FavoritesView.swift
//  NatureWalk
//
//  Created by Tarun Shokeen on 12/06/24.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        NavigationView {
            List {
                ForEach(user.favoriteSessions) { session in
                    Text(session.name)
                }
                .onDelete(perform: removeSessions)
            }
            .navigationBarTitle("Favorites")
            .navigationBarItems(trailing: Button(action: {
                user.favoriteSessions.removeAll()
            }) {
                Text("Clear All")
            })
        }
    }
    
    private func removeSessions(at offsets: IndexSet) {
        user.favoriteSessions.remove(atOffsets: offsets)
    }
}
