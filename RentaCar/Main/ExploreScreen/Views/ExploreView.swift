//
//  ExploreView.swift
//  RentaCar
//
//  Created by Faryk on 13.12.2024.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewmodel: ExploreViewModel
    init(viewmodel: ExploreViewModel) {
        self._viewmodel = StateObject(wrappedValue: viewmodel)
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack{
                    GradientColorBackground()
                    VStack{
                        Spacer().frame(height: 10)
                        CustomSearchBar()
                        Spacer().frame(height: 60)
                        PopularBrandsView(viewModel: viewmodel)
                    }
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
    ExploreView(viewmodel: ExploreViewModel())
}


