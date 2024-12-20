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
                // Gradient background
                GradientColorBackground()

                // ScrollView with content
                ScrollView {
                    VStack {
                        // Content views
                        Spacer().frame(height: 40)
                        CustomSearchBar() // Search bar component
                        Spacer().frame(height: 70)
                        PopularBrandsView(viewModel: viewmodel) // Brands section
                        
                        // Available Cars section
                        AvailableCarsListView() // Display available cars
                    }
                }
            }
            .navigationBarTitle("Rentacar", displayMode: .inline)
            .navigationBarItems(
                leading: Circle()
                    .fill(.black.opacity(0.1))
                    .frame(width: 45, height: 45)
                    .overlay(
                        Circle().stroke(Color.black, lineWidth: 0.5)
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
                        Circle().stroke(Color.black, lineWidth: 0.5)
                    )
            )
        }
    }
}

// Define GradientColorBackground as a separate reusable component
struct GradientColorBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.gray, Color.white]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea() // Makes the gradient fill the whole screen
        .frame(width: UIScreen.main.bounds.width) // Fills the width of the screen
    }
}



#Preview {
    ExploreView()
        .environmentObject(ExploreViewModel())
}
