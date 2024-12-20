//
//  AvailableCarsView.swift
//  RentaCar
//
//  Created by Faryk on 20.12.2024.
//

import SwiftUI

struct AvailableCarsView: View {
    let car: Car // Pass the selected car to this view
    
    var body: some View {
        VStack {
            // Car Image
            Image(car.displayImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()

            // Car Name and Details
            Text(car.carName)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 5)

            Text("Rating: \(String(format: "%.1f", car.rating)) ⭐️")
                .font(.subheadline)
                .padding(.bottom, 5)

            Text("Price per day: $\(car.pricePerDay)")
                .font(.subheadline)
                .padding(.bottom, 5)

            Text("Description: \(car.description)")
                .font(.body)
                .padding(.bottom, 5)

            Text("Host: \(car.hostName)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 5)

            Spacer()
        }
        .padding()
        .navigationBarTitle(car.carName, displayMode: .inline)
    }
}

#Preview {
    AvailableCarsView(car: Car(id: UUID().uuidString, carName: "BMW X1", rating: 4.4, brand: "BMW", pricePerDay: 60, description: "Modern BMW for the classy ones", displayImageName: "bmwx1", imageNames: [], insurance: "Basic Insurance", numberOfSeats: 6, numberofDoors: 4, GasType: "Premium", hostName: "Nina Rental", isFavorite: false, hostImageName: "dwight", hostJoinDate: "06 March 2018"))
}

