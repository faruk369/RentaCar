//
//  BookedCarView.swift
//  RentaCar
//
//  Created by Faryk on 31.12.2024.
//

import SwiftUI

struct BookedCarView: View {
    @ObservedObject var CartViewmodel: CartViewModel
    let bookedCar: BookedCar
    
    var body: some View {
        VStack {
            HStack {
                // Car Image
                Image(bookedCar.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .padding(.trailing)
                
                // Car Title and Rating
                VStack(alignment: .leading) {
                    Text(bookedCar.name)
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    HStack {
                        Text(String(format: "%.1f", bookedCar.rating))
                            .font(.subheadline)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    
                    HStack{
                        Text("\(bookedCar.location)")
                    }
                    
                    HStack {
                        Text(bookedCar.hostName)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                VStack{
                HStack{
                    Text("Total: $\(bookedCar.finalPrice)")
                        .foregroundStyle(Color(.green))
                }
                HStack{
                    Text("Hours: \(bookedCar.duration)")
                }
            }
                    .padding(.top, 1)
                    .padding(.horizontal)
            }
            
        }
    }
}

