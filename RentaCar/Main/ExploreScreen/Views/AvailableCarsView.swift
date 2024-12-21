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
                    // The TabView for swipeable images
                    TabView {
                        ForEach(car.imageNames, id: \.self) { imageName in
                            Image(imageName) // Assuming images are in your assets
                                .resizable() // Make the image resizable
                                .scaledToFill() // Ensure it fills the available space
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.50) // 35% of screen height
                                .cornerRadius(10) // No rounded corners to make it fit perfectly
            
                        }
                    }
                    .tabViewStyle(.page) // Page style tab view for swiping
                    
                    }
                    .navigationBarTitle(car.carName, displayMode: .inline) // Title at the top
                    
                    // car details
                    VStack(alignment: .leading, spacing: 10) {
                        Text(car.carName)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Rating: \(String(format: "%.1f", car.rating)) ⭐️")
                            .font(.subheadline)
                        
                        Text("Price per day: $\(car.pricePerDay)")
                            .font(.subheadline)
                        
                        Text("Description: \(car.description)")
                            .font(.body)
                        
                        Text("Host: \(car.hostName)")
                                       .font(.subheadline)
                                       .foregroundColor(.gray)
                                   
                                   Spacer()
                               }
                               .padding([.horizontal, .top], 5) // Padding for car details section
                           }
    
                       }

#Preview {
    AvailableCarsView(car: Car(id: UUID().uuidString, carName: "BMW X1", rating: 4.4, brand: "BMW", pricePerDay: 60, description: "Modern BMW for the classy ones", displayImageName: "bmwx1", imageNames: [], insurance: "Basic Insurance", numberOfSeats: 6, numberofDoors: 4, GasType: "Premium", hostName: "Nina Rental", isFavorite: false, hostImageName: "dwight", hostJoinDate: "06 March 2018"))
}

