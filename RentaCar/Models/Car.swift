//
//  Car.swift
//  RentaCar
//
//  Created by Faryk on 16.12.2024.
//

import Foundation

struct Car: Identifiable, Hashable,Codable {
    
    let  id: String
    let carName: String
    var rating: Double
    let  brand: String
    var pricePerDay: Int
    var description: String
    var displayImageName: String  //Square Image on the list view
    var imageNames: [String]
    var insurance: String
    var maxDistance: Float? //optinonal because the car could be brand new
    var numberOfSeats: Int
    var numberofDoors: Int
    var GasType: String
    var hostName: String
    var isFavorite: Bool
    var hostImageName: String
    var hostJoinDate: String
    var isBookingConfirmed: Bool 
    
}
