//
//  ExploreView.swift
//  RentaCar
//
//  Created by Faryk on 13.12.2024.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var viewmodel: ExploreViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Gradient background that covers the entire screen
                GradientColorBackground()

                // ScrollView with content
                ScrollView {
                    VStack {
                        // Content views
                        Spacer().frame(height: 40)
                        CustomSearchBar()
                        Spacer().frame(height: 70)
                        PopularBrandsView(viewModel: viewmodel)
                        
                        // Available Cars section
                        VStack {
                            HStack {
                                Text("Available Cars")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            .foregroundStyle(.white)
                        }
                        .padding()

                        // ForEach loop to display cars
                        ForEach(viewmodel.cars) { car in
                            DefaultCarView(viewmodel: viewmodel, car: car)
                        }
                    }
                }
            }
            .navigationBarTitle("Rentacar", displayMode: .inline)
            
            // .navigationBarBackgroundHidden(true)  // Hide the default navigation bar background
            .navigationBarItems(
                leading: Circle()
                    .fill(.black.opacity(0.1))
                    .frame(width: 45, height: 45)
                    .overlay(
                            Circle() // Add the black circle frame around the bell
                            .stroke(Color.black, lineWidth: 0.5) // Thin black border
                                        )
                    .overlay {
                        Image(systemName: "bell.fill")
                            .foregroundStyle(.black)
                    },
                trailing: Image("dwight")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay(
                            Circle() // Add the black circle frame around the image
                            .stroke(Color.black, lineWidth: 0.5) // Thin black border
                                        )
            )
        }
    }
}



struct GradientColorBackground: View {
    var body: some View {
        VStack {
            // Gradient from solid gray to white
            LinearGradient(
                gradient: Gradient(colors: [Color.gray, Color.white]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.width)
        }
    }
}



#Preview {
    ExploreView()
        .environmentObject(ExploreViewModel())
}


