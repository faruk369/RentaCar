//
//  FavoritesViewModel.swift
//  RentaCar
//
//  Created by Faryk on 17.12.2024.
//

import SwiftUI

class  FavoritesViewModel: ObservableObject{
   @Published var favoritedCars: [Car] = []
    
    func toggleFavourite(for car: Car) {
            if let index = favoritedCars.firstIndex(where: { $0.id == car.id }) {
                // If the car is already favourited, remove it
                favoritedCars.remove(at: index)
            } else {
                // If the car is not favourited, add it
                favoritedCars.append(car)
            }
        }
    
}
