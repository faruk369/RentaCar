//
//  CartView.swift
//  RentaCar
//
//  Created by Faryk on 30.12.2024.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel

    var body: some View {
        NavigationView {
            ZStack {
                GradientColorBackground()
                    .edgesIgnoringSafeArea(.all) // Gradient covers the entire screen

                // Show either the list of cars or the "No booked cars" message
                if cartViewModel.bookedCars.isEmpty {
                    Text("No booked cars")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                } else {
                    List {
                        // Iterate over the list of booked cars
                        ForEach(cartViewModel.bookedCars) { bookedCar in
                            BookedCarView(CartViewmodel: cartViewModel, bookedCar: bookedCar)
                                .padding(.bottom, 10) // Add some spacing between list items
                        }
                        .onDelete(perform: deleteBookedCar) // Swipe-to-delete functionality
                    }
                    .listStyle(PlainListStyle()) // Use plain list style to avoid default styling
                }
            }
            .navigationTitle("Cart") // Title for the navigation bar
        }
    }

    // Function to handle deleting a car from the cart
    private func deleteBookedCar(at offsets: IndexSet) {
        cartViewModel.bookedCars.remove(atOffsets: offsets)
    }
}

#Preview {
    CartView()
        .environmentObject(CartViewModel())
        .environmentObject(ExploreViewModel())
}
