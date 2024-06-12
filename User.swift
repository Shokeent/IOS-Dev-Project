//
//  User.swift
//  NatureWalk
//
//  Created by Tarun Shokeen on 12/06/24.
//

import SwiftUI

class User: ObservableObject {
    let email: String
    let password: String
    @Published var favoriteSessions: [Session]
    
    init(email: String, password: String, favoriteSessions: [Session] = []) {
        self.email = email
        self.password = password
        self.favoriteSessions = favoriteSessions
    }
}


