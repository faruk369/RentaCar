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
                    
                ScrollView {
                    VStack{
                    // Show either the list of cars or the "No booked cars" message
                    if cartViewModel.bookedCars.isEmpty {
                        Text("No booked cars")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                    } else {
                            // Iterate over the list of booked cars
                            ForEach(cartViewModel.bookedCars) { bookedCar in
                                BookedCarView(CartViewmodel: cartViewModel, bookedCar: bookedCar)
                                    .padding(.bottom, 10)
                            }
                            .onDelete(perform: deleteBookedCar) // Swipe-to-delete functionality
                    }
                    }
                }
                
            }
            .navigationTitle("Cart")
            .font(.title3)
            .navigationBarTitleDisplayMode(.inline)
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
