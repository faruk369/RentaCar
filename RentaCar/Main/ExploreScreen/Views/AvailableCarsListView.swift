//
//  AvailableCarsListView.swift
//  RentaCar
//
//  Created by Faryk on 20.12.2024.
//

import SwiftUI

struct AvailableCarsListView: View {
    @EnvironmentObject var viewmodel: ExploreViewModel
    
    var body: some View {
        VStack {
            // Available Cars section header
            HStack {
                Text("Available Cars")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
            }
            .foregroundStyle(.white)
            .padding()

            // Display each car using NavigationLink
            ForEach(viewmodel.cars) { car in
                NavigationLink(destination: AvailableCarsView(car: car)) { // Wrap in NavigationLink
                    DefaultCarView(viewmodel: viewmodel, car: car)
                        .padding(.vertical, 10)
                }
                .buttonStyle(PlainButtonStyle()) // Prevents link from having default button styling
            }
        }
    }
}

#Preview {
    AvailableCarsListView()
        .environmentObject(ExploreViewModel())
}

