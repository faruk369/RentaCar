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
                
                // Car Title
                VStack(alignment: .leading) {
                    Text(bookedCar.name)
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                  // Selected Location
                    HStack{
                        Text("\(bookedCar.location)")
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
            }
            .padding()
            .padding(.top, 1)
            .padding(.horizontal)
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

