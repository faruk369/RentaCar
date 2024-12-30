//
//  RentaCarApp.swift
//  RentaCar
//
//  Created by Faryk on 13.12.2024.
//

import SwiftUI

@main
struct RentaCarApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}

struct ContentView: View {
    @StateObject var cartViewModel = CartViewModel()  // Initialize CartViewModel once here

    var body: some View {
        TabView {
            AvailableCarsView(car: Car(id: UUID().uuidString, carName: "BMW X1", rating: 4.4, brand: "BMW", pricePerDay: 60, description: "Modern BMW for the classy ones", displayImageName: "bmwx1_1", imageNames: ["bmwx1_1", "bmwx1_2", "bmwx1_3"], insurance: "Basic Insurance", numberOfSeats: 6, numberofDoors: 4, GasType: "Premium", hostName: "Nina Rental", isFavorite: false, hostImageName: "dwight", hostJoinDate: "06 March 2018", isBookingConfirmed: false))
                .tabItem {
                    Label("Available Cars", systemImage: "square.grid.2x2")
                }
            
            CartView()  // This view will show the booked cars
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
        }
        .environmentObject(cartViewModel)  // Pass the CartViewModel to child views
    }
}
