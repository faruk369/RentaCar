//
//  CustomSearchBar.swift
//  RentaCar
//
//  Created by Faryk on 14.12.2024.
//

import SwiftUI

struct CustomSearchBar: View {
    var body: some View {
        Button(action:{}, label: {
            HStack{
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                    .foregroundStyle(.black)
                Text("Search a Car")
                    .font(.footnote)
                    .foregroundStyle(.black)
                Spacer()
            }
            .frame(height: 60)
            .overlay{
                Capsule()
                    .stroke(lineWidth: 0.8)
                    .foregroundStyle(Color(.black))
                    .shadow(color:.black, radius: 10)
            }
            .padding(.horizontal)
        })
    }
    
}

#Preview {
    CustomSearchBar()
}
