//
//  DefaultCarView.swift
//  RentaCar
//
//  Created by Faryk on 16.12.2024.
//

import SwiftUI

struct DefaultCarView: View {
    @ObservedObject var viewmodel: ExploreViewModel
    let car: Car
    
    var body: some View {
        VStack {
            HStack {
                // Car Image
                Image(car.displayImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .padding(.trailing)
                
                // Car Title and Rating
                VStack(alignment: .leading) {
                    Text(car.carName)
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    HStack {
                        Text(String(format: "%.1f", car.rating))
                            .font(.subheadline)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    HStack {
                        Text(car.hostName)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                // Favorite Button
                Button(action: {
                    viewmodel.toggleFavorite(for: car.id)
                }) {
                    Image(systemName: car.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .padding(10)
                }
            }
            .padding()
            
            // "From <hostName>" aligned under the title, rating, and favorite button
         
            .padding(.top, 1)
            .padding(.horizontal)
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}
