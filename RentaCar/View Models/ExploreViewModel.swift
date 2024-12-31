//
//  ExploreViewModel.swift
//  RentaCar
//
//  Created by Faryk on 14.12.2024.
//

import SwiftUI

class ExploreViewModel: ObservableObject {
    @Published var mybrands: [Brands] = [
        Brands(id: UUID().uuidString, brandName: "BMW", imageName: "bmw", carIDs: []),
        Brands(id: UUID().uuidString, brandName: "Mercedes", imageName: "mercedes", carIDs: []),
        Brands(id: UUID().uuidString, brandName: "Jaguar", imageName: "jaguar", carIDs: []),
        Brands(id: UUID().uuidString, brandName: "Audi", imageName: "audi", carIDs: [])
    ]
    
    @Published var cars: [Car] = [
        Car(id: UUID().uuidString, carName: "BMW X1", rating: 4.4, brand: "BMW", pricePerDay: 60, description: "Modern BMW for the classy ones", displayImageName: "bmwx1", imageNames: ["bmwx1_1", "bmwx1_2", "bmwx1_3"], insurance: "Basic Insurance", numberOfSeats: 6, numberofDoors: 4, GasType: "Premium", hostName: "Nina Rental", isFavorite: false, hostImageName: "dwight", hostJoinDate: "06 March 2018",isBookingConfirmed: false),
        Car(id: UUID().uuidString, carName: "Mercedes Benz", rating: 4.9, brand: "Mercedes", pricePerDay: 90, description: "World class, fast & fuel efficient car", displayImageName: "merecedesC", imageNames: ["mercedes_c_0", "mercedes_c_1", "mercedes_c_2", "mercedes_c_3", "mercedes_c_4"], insurance: "Basic Insurance", numberOfSeats: 5, numberofDoors: 4, GasType: "Premium", hostName: "Anna", isFavorite: false, hostImageName: "michael_scott", hostJoinDate: "19 August 2021", isBookingConfirmed: true),
        
        Car(id: UUID().uuidString, carName: "Jaguar", rating: 4.8, brand: "Jaguar", pricePerDay: 50, description: "Basic  durable Jaguar", displayImageName: "jaguarC0", imageNames: [], insurance: "Basic", numberOfSeats: 4, numberofDoors: 4, GasType: "Premium", hostName: "Anna", isFavorite: false, hostImageName: "dwight", hostJoinDate: "01/01/2023",isBookingConfirmed: true),
        
        Car(id: UUID().uuidString, carName: "Audi Base", rating: 5.0, brand: "Audi", pricePerDay: 60, description: "Best Audi-Fuel Efficient", displayImageName: "AudiC0", imageNames: [], insurance: "Basic", numberOfSeats: 5, numberofDoors: 4, GasType: "Premieum", hostName: "Anna", isFavorite: false, hostImageName: "dwight", hostJoinDate: "15/03/2019", isBookingConfirmed: true)
        
    ]
    
    @Published var favouritedCars: [Car] = []
    
    func toggleFavorite(for carId: String) {
        if let index = cars.firstIndex(where: { $0.id == carId }) {
            // Toggle the isFavorite property
            cars[index].isFavorite.toggle()
            
            // Update the favouritedCars list based on the new favourite state
            if cars[index].isFavorite {
                // Add to favourited cars if it's now favourited
                favouritedCars.append(cars[index])
            } else {
                // Remove from favourited cars if it's now un-favourited
                favouritedCars.removeAll { $0.id == carId }
            }
        }
        
    
        
        
    }
}
