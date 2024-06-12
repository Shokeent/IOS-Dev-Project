//
//  LoginView.swift
//  NatureWalk
//
//  Created by Tarun Shokeen on 12/06/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var user1: User
    @EnvironmentObject var user2: User
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    @State private var loggedInUser: User? = nil
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Toggle(isOn: $rememberMe) {
                Text("Remember Me")
            }
            .padding()
            
            Button("Login") {
                login()
            }
            .padding()
            
            if let user = loggedInUser {
                NavigationLink(destination: SessionsListView().environmentObject(user)) {
                    Text("Proceed to Sessions")
                }
                .padding()
            }
        }
        .padding()
    }
    
    private func login() {
        if email == user1.email && password == user1.password {
            loggedInUser = user1
        } else if email == user2.email && password == user2.password {
            loggedInUser = user2
        } else {
            loggedInUser = nil
        }
        
        if rememberMe, let user = loggedInUser {
            UserDefaults.standard.set(user.email, forKey: "email")
            UserDefaults.standard.set(user.password, forKey: "password")
        }
    }
}
