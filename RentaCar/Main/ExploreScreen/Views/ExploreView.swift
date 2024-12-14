//
//  ExploreView.swift
//  RentaCar
//
//  Created by Faryk on 13.12.2024.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack{
                    GradientColorBackground()
                    Spacer().frame(height:150)
                    CustomSearchBar()
                }
            }
            
                .navigationStackModifier()
        }
    }
}


struct GradientColorBackground: View {
    var body: some View{
        VStack{
            LinearGradient(colors: [.white, .gray], startPoint: .top, endPoint: .bottom)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            Spacer()
        }
    }
}

#Preview {
    ExploreView()
}


