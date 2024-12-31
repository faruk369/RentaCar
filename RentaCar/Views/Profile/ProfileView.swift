//
//  ProfileView.swift
//  RentaCar
//
//  Created by Faryk on 23.12.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            GradientColorBackground()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    // Header with profile title left and settings icon right
                    HStack {
                        Text("Profile")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Spacer() // Pushes the title to the left and icon to the right
                        
                        Button(action: {
                            // Settings action here
                        }) {
                            Image(systemName: "gearshape.fill")
                                .font(.title)
                                .foregroundColor(.primary)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.horizontal)

                    // Profile Image Section
                    VStack {
                        Image("dwight") // Placeholder profile image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 2))
                            .shadow(radius: 10)

                        Text("@username")
                            .font(.title2)
                            .fontWeight(.medium)
                            .padding(.top, 5)
                        
                        HStack {
                            Text("Verified")
                                .font(.body)
                                .foregroundColor(.blue)
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        .padding(.top, 2)
                    }
                    .padding(.top, 20)

                    // Booked Trip Section
                    HStack{
                                   HStack{
                                       RoundedRectangle(cornerRadius: 10)
                                           .fill(Color.white.opacity(0.7))
                                           .frame(width: 150, height: 200)
                                           .shadow(radius: 5)
                                           .overlay(
                                               VStack{
                                                   Text("Booked Trips: ")
                                                       .fontWeight(.bold)
                                                       .padding(.top, -50)
                                                   Text("4")
                                                       .font(.system(size: 50, weight: .bold))
                                                       .padding(.top, 0)
                                               }
                                           )
                                   }
                                   Spacer()
                                   HStack{
                                       RoundedRectangle(cornerRadius: 10)
                                           .fill(Color.white.opacity(0.7))
                                           .frame(width: 150, height: 200)
                                           .shadow(radius: 5)
                                           .overlay(
                                            VStack{
                                                Text("Loyalty points: ")
                                                    .fontWeight(.bold)
                                                    .padding(.top, -50)
                                                Text("40")
                                                    .font(.system(size: 50, weight: .bold))
                                                    .padding(.top, 0)
                                            }
                                           )
                                   }
                               }
                               .padding()

                    Spacer()
                }
                .padding(.bottom)
            }
        }
    }
}



#Preview {
    ProfileView()
}
