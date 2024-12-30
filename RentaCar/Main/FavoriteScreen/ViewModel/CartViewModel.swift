//
//  CartViewModel.swift
//  RentaCar
//
//  Created by Faryk on 30.12.2024.
//
import SwiftUI
import Combine

class CartViewModel: ObservableObject {
    @Published var bookedCars: [BookedCar] = []

    func bookTheCar(car: Car, date: Date, location: String, duration: Int) {
        // Debugging: Print the input values
       // print("bookTheCar called with:")
       // print("Car: \(car.carName), Date: \(date), Location: \(location), Duration: \(duration) hours")

        // Calculate the final price
        let finalPrice = car.pricePerDay * duration
       // print("Calculated Final Price: $\(finalPrice)")

        // Create the BookedCar object
        let newBookedCar = BookedCar(
            name: car.carName,
            description: car.description,
            image: car.displayImageName,
            date: date,
            location: location,
            duration: duration,
            finalPrice: finalPrice,
            rating: car.rating,
            hostName: car.hostName
        )

        // Debugging: Check the new booked car details
        //print("New BookedCar created: \(newBookedCar)")

        // Append the new booked car to the array
        bookedCars.append(newBookedCar)
        
        objectWillChange.send()

        // Debugging
            //print("Booked cars after append: \(bookedCars)") // This should show the updated array
    }
}

