//
//  NatureWalkApp.swift
//  NatureWalk
//
//  Created by Tarun Shokeen on 12/06/24.
//

import SwiftUI

@main
struct NatureWalkApp: App {
    @StateObject private var user1 = User(email: "test@gmail.com", password: "test123")
    @StateObject private var user2 = User(email: "admin@gmail.com", password: "admin123")
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(user1)
                .environmentObject(user2)
        }
    }
}
