//
//  AvailableCarsView.swift
//  RentaCar
//
//  Created by Faryk on 20.12.2024.
//

import SwiftUI

struct AvailableCarsView: View {
    let car: Car // Pass the selected car to this view
    let imageFrameTabView:CGFloat = UIScreen.main.bounds.height / 3 // Creating frame for the pictures
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0.5) { //left-aligned the select trip section
                // The TabView for swipeable images (50% of screen height)
                TabView {
                    ForEach(car.imageNames, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                    }
                }
                .tabViewStyle(.page)
                .frame(height: imageFrameTabView)
                .ignoresSafeArea()
                
                // Divider separating the image carousel from the next section
                Divider()
                
                // Trip Selection Section (directly below the image carousel)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Select Trip Duration:")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.darkGray))
                    
                    HStack {
                        Image(systemName: "timer")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    .padding(.leading, 0)
                }
                .padding(.horizontal)
                
                // Spacer to push content if more sections are added
                Spacer(minLength: 16) // Flexible space for future additions
            }
            .frame(height: UIScreen.main.bounds.height * 0.50) // Constraining the height to 50% of the screen height
            .navigationBarTitle(car.carName, displayMode: .inline)
        }
    }
}


#Preview {
    AvailableCarsView(car: Car(id: UUID().uuidString, carName: "BMW X1", rating: 4.4, brand: "BMW", pricePerDay: 60, description: "Modern BMW for the classy ones", displayImageName: "bmwx1", imageNames: [], insurance: "Basic Insurance", numberOfSeats: 6, numberofDoors: 4, GasType: "Premium", hostName: "Nina Rental", isFavorite: false, hostImageName: "dwight", hostJoinDate: "06 March 2018"))
}

