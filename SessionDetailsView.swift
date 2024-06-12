//
//  SessionDetailsView.swift
//  NatureWalk
//
//  Created by Tarun Shokeen on 12/06/24.
//

import SwiftUI

struct SessionDetailsView: View {
    @ObservedObject var session: Session
    @EnvironmentObject var user: User
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(session.name)
                    .font(.largeTitle)
                    .padding(.bottom, 10)
                
                ForEach(session.photos, id: \.self) { photo in
                    Image(photo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 10)
                }
                
                Text(session.description)
                    .font(.body)
                    .padding(.bottom, 10)
                
                HStack {
                    Text("Rating: \(session.rating, specifier: "%.1f")")
                    Spacer()
                    Text("Price: $\(session.price, specifier: "%.2f")/person")
                }
                .padding(.bottom, 10)
                
                HStack {
                    Text("Guide: \(session.guideName)")
                    Spacer()
                    Button(action: {
                        if let url = URL(string: "tel://\(session.guidePhoneNumber)") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text(session.guidePhoneNumber)
                            .underline()
                    }
                }
                .padding(.bottom, 10)
                
                HStack {
                    Button(action: {
                        if user.favoriteSessions.contains(where: { $0.id == session.id }) {
                            user.favoriteSessions.removeAll { $0.id == session.id }
                        } else {
                            user.favoriteSessions.append(session)
                        }
                    }) {
                        Text(user.favoriteSessions.contains(where: { $0.id == session.id }) ? "Remove from Favorites" : "Add to Favorites")
                    }
                    
                    Spacer()
                    
                    Button(action: shareSession) {
                        Text("Share")
                    }
                }
                .padding(.top, 20)
            }
            .padding()
        }
    }
    
    private func shareSession() {
        let textToShare = "Check out this session: \(session.name) - $\(session.price)/person"
        let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}
