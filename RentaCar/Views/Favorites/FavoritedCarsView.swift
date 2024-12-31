//
//  FavoritedCarsView.swift
//  RentaCar
//
//  Created by Faryk on 17.12.2024.
//

import SwiftUI

struct FavoritedCarsView: View {
    @EnvironmentObject var viewmodel: ExploreViewModel
    
    var body: some View {
        NavigationView {
            ZStack{
                GradientColorBackground()
                ScrollView {
                    VStack {
                        if viewmodel.favouritedCars.isEmpty {
                            Text("No favorite cars")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding()
                        } else {
                            ForEach(viewmodel.favouritedCars) { car in
                                DefaultCarView(viewmodel: viewmodel, car: car)
                            }
                        }
                    }
                }
                // Using toolbar to add a custom centered title
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Favorites")
                            .font(.title3)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .center) // Center the text
                    }
                }
                Spacer()
                    .navigationBarTitleDisplayMode(.inline) // inline title style
            }
        }
    }
}

#Preview {
    FavoritedCarsView()
        .environmentObject(ExploreViewModel())
}
