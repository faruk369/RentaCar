//
//  ProfileView.swift
//  RentaCar
//
//  Created by Faryk on 23.12.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            GradientColorBackground()
            ScrollView{
                VStack {
                    Image("dwight")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .scaledToFill()
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.black, lineWidth: 0.5)
                        )
                }
                
                Spacer()
                
                HStack{
                    HStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(width: 150, height: 200)
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
                            .fill(Color.white)
                            .frame(width: 150, height: 200)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ProfileView()
}
