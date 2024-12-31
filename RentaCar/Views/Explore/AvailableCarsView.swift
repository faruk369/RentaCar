//
//  AvailableCarsView.swift
//  RentaCar
//
//  Created by Faryk on 20.12.2024.
//

import SwiftUI
import Combine

struct AvailableCarsView: View {
    let car: Car // Pass the selected car to this view
    let imageFrameTabView: CGFloat = UIScreen.main.bounds.height / 2.5
    @State private var date = Date.now
    @State private var selectedDuration = 3
    @State private var isPickerExpanded = false // Boolean to toggle the visibility of hours
    @State private var location: String = "Current Location" // Default location text
    @EnvironmentObject var cartViewModel: CartViewModel
    @State private var userInput: String = ""
    
    // Get the current date with no time
    var currentDate: Date {
        return Calendar.current.startOfDay(for: Date())
    }
    
    var body: some View {
        ZStack {
            GradientColorBackground()
            
            ScrollView {
                VStack(spacing:12) {
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
                    
                    Divider()
                    
                    // Booking Details Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Booking details:")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.black))
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Image(systemName: "calendar")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                
                                DatePicker("Date", selection: $date, in: currentDate..., displayedComponents: [.date])
                                    .datePickerStyle(CompactDatePickerStyle())
                                    .frame(maxHeight: 400)
                                    .padding(.leading, 8)
                            }
                            .padding(.top, -2)
                        }
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Image(systemName: "timer")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                
                                Text("Duration")
                                    .font(.body)
                                    .foregroundStyle(Color(.black))
                                    .padding(.leading, 8)
                                Spacer()
                                
                                Picker("Select Duration", selection: $selectedDuration) {
                                    ForEach(isPickerExpanded ? 3..<72 : 3..<4, id: \.self) { hour in
                                        Text("\(hour) hours\(hour > 3 ? "s" : "")")
                                            .tag(hour)
                                    }
                                }
                                .pickerStyle(WheelPickerStyle())
                                .frame(width: 100)
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
                    
                    // Location Picker
                    VStack{
                        HStack {
                            Image(systemName: "mappin.and.ellipse.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                            Text("Location")
                                .font(.body)
                                .padding(.leading, 8)
                            Spacer()
                            Picker("Select Location", selection: $location) {
                                ForEach(["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX", "Miami, FL"], id: \.self) { city in
                                    Text(city)
                                        .tag(city)
                                }
                            }
                            .padding(.trailing)
                        }
                    }
                    .padding(.trailing)
                    .padding(.top, -80)
                    
                    // Insurance
                    VStack{
                                    HStack{
                                        HStack{
                                            Image(systemName: "checkmark.circle")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                            
                                            Text("Insurance")
                                                .font(.body)
                                                .padding(.leading, 8)
                                            Spacer()
                                            Button(action:{
                                                // here screen pops up with read more
                                            }){
                                                Text("Read More")
                                                    .font(.headline)
                                                    .foregroundColor(.blue)
                                            }
                                            .padding(.all)
                                        }
                                    }
                                    
                                }
                                .padding(.trailing)
                                .padding(.top, -40)
                    
                    // Confirm section
                    HStack {
                        Button(action: {
                            //Debug code
                           // print("Confirm Button Pressed")
                                   // print("Date: \(date), Location: \(location), Duration: \(selectedDuration)")
                            
                            // Confirm the booking by passing the data to the CartViewModel
                            cartViewModel.bookTheCar(car: car, date: date, location: location, duration: selectedDuration)
                            
                            //Debug code
                            // print("Booked cars: \(cartViewModel.bookedCars.count)")
                            
                        }) {
                            Text("Confirm Booking")
                                .font(.headline)
                                .cornerRadius(10)
                        }
                        .padding()
                        .buttonStyle(.borderedProminent)
                        .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitle(car.carName, displayMode: .inline)
        }
        
    }
}


#Preview {
    AvailableCarsView(car: Car(id: UUID().uuidString, carName: "BMW X1", rating: 4.4, brand: "BMW", pricePerDay: 60, description: "Modern BMW for the classy ones", displayImageName: "bmwx1_1", imageNames: ["bmwx1_1","bmwx1_2", "bmwx1_3"], insurance: "Basic Insurance", numberOfSeats: 6, numberofDoors: 4, GasType: "Premium", hostName: "Nina Rental", isFavorite: false, hostImageName: "dwight", hostJoinDate: "06 March 2018", isBookingConfirmed: false))
        .environmentObject(CartViewModel())
}

