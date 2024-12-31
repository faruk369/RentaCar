//
//  BookedCarModel.swift
//  RentaCar
//
//  Created by Faryk on 30.12.2024.
//

import Foundation
import SwiftUI

// Model to store the user's input 
struct BookedCar: Identifiable, Hashable, Codable {
    var id = UUID()
    var name: String
    var description: String
    var image: String
    var date: Date
    var location: String
    var duration: Int
    var finalPrice: Int  // Calculate based on duration and pricePerDay
    var rating: Double
    var hostName: String
    
}
