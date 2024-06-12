//
//  SessionListView.swift
//  NatureWalk
//
//  Created by Tarun Shokeen on 12/06/24.
//

import SwiftUI

struct SessionsListView: View {
    @EnvironmentObject var user: User
    
    var sessions: [Session] = [
        Session(name: "Morning Park Walk", description: "A refreshing morning walk in the park.", rating: 4.5, guideName: "John Doe", photos: ["park1", "park2"], price: 10.0, guidePhoneNumber: "1234567890"),
        Session(name: "Valley Hike", description: "An adventurous hike through the valley.", rating: 4.8, guideName: "Jane Smith", photos: ["valley1", "valley2"], price: 20.0, guidePhoneNumber: "0987654321"),
        Session(name: "Meadow Stroll", description: "A peaceful stroll through the meadow.", rating: 4.3, guideName: "Sam Brown", photos: ["meadow1", "meadow2"], price: 15.0, guidePhoneNumber: "1122334455")
    ]
    
    var body: some View {
        NavigationView {
            List(sessions) { session in
                NavigationLink(destination: SessionDetailsView(session: session).environmentObject(user)) {
                    HStack {
                        Image(session.photos.first ?? "")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(session.name)
                                .font(.headline)
                            Text("$\(session.price, specifier: "%.2f")/person")
                        }
                    }
                }
            }
            .navigationBarTitle("Nature Walk Sessions")
        }
    }
}
