//
//  ProfileView.swift
//  RentaCar
//
//  Created by Faryk on 23.12.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
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
    }
}

#Preview {
    ProfileView()
}
