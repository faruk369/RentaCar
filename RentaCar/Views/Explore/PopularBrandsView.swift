//
//  PopularBrandsView.swift
//  RentaCar
//
//  Created by Faryk on 15.12.2024.
//

import SwiftUI

struct PopularBrandsView: View {
    @ObservedObject var viewModel: ExploreViewModel // Using @ObservedObject

    var body: some View {
            VStack{
                HStack{
                    Text("Popular Brands")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                    Button(action: {}, label: {
                        Text("See All")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    })
                }
                .foregroundStyle(.white)

                // Horizontal Scroll View for cards
                ScrollView(.horizontal, showsIndicators: false) { // hides the scroll indicator
                    HStack(spacing: 16) { // added spacing to separate cards
                        ForEach(viewModel.mybrands) { brand in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: 150, height: 200)
                                .overlay(
                                    VStack {
                                        // Image part
                                        Image(brand.imageName) // Shows the logos
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                        Text(brand.brandName)
                                        Text("+6")
                                            .font(.caption)
                                            .padding(.top, 8)
                                    }
                                )
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.leading)
       
    }
}

// Preview
struct PopularBrandsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularBrandsView(viewModel: ExploreViewModel())
    }
}
