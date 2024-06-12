//
//  Session.swift
//  NatureWalk
//
//  Created by Tarun Shokeen on 12/06/24.
//

import SwiftUI

class Session: Identifiable, ObservableObject {
    let id = UUID()
    let name: String
    let description: String
    let rating: Double
    let guideName: String
    let photos: [String]
    let price: Double
    let guidePhoneNumber: String
    
    init(name: String, description: String, rating: Double, guideName: String, photos: [String], price: Double, guidePhoneNumber: String) {
        self.name = name
        self.description = description
        self.rating = rating
        self.guideName = guideName
        self.photos = photos
        self.price = price
        self.guidePhoneNumber = guidePhoneNumber
    }
}

