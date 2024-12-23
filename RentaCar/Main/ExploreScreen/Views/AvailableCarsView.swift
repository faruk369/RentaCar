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
    @State private var date = Date.now
    @State private var selectedDuration = 3
    @State private var isPickerExpanded = false // Boolean to toggle the visibility of hours
    
    // Get the current date with no time
    var currentDate: Date {
        return Calendar.current.startOfDay(for: Date())
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 0.5) {
                
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
                    
                    // Wrap the DatePicker and icon in a VStack
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                            // DatePicker for selecting a future date (no time part)
                            DatePicker("Select Date",
                                       selection: $date,
                                       in: currentDate..., // Prevent selecting past dates
                                       displayedComponents: [.date]) // Only show the date (no time)
                            .datePickerStyle(CompactDatePickerStyle())
                            .frame(maxHeight: 400)
                            .padding(.leading, 8)
                        }
                    }
                    
                    // Duration Section
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "timer")
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                            Text("Duration")
                                .font(.headline)
                                .foregroundStyle(Color(.darkGray))
                                .padding(.leading, 8)
                            Spacer()
                            // Wheel Picker for selecting hours (range 3 to 72 hours)
                            Picker("Select Duration", selection: $selectedDuration) {
                                ForEach(isPickerExpanded ? 3..<72 : 3..<4, id: \.self) { hour in
                                    Text("\(hour) hours\(hour > 3 ? "s" : "")")
                                        .tag(hour)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: 120)
                            .onTapGesture {
                                withAnimation {
                                    isPickerExpanded.toggle() // Toggle the picker expansion on tap
                                }
                            }
                        }
                    }
                    .padding(.top, -80)
                }
                .padding(.leading, 0)
            }
            .padding(.horizontal)
            
        }
        .navigationBarTitle(car.carName, displayMode: .inline)
        
    }
       
}
    

#Preview {
    AvailableCarsView(car: Car(id: UUID().uuidString, carName: "BMW X1", rating: 4.4, brand: "BMW", pricePerDay: 60, description: "Modern BMW for the classy ones", displayImageName: "bmwx1", imageNames: [], insurance: "Basic Insurance", numberOfSeats: 6, numberofDoors: 4, GasType: "Premium", hostName: "Nina Rental", isFavorite: false, hostImageName: "dwight", hostJoinDate: "06 March 2018"))
}

