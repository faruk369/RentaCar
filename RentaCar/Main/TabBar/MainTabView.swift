//
//  MainTabView.swift
//  RentaCar
//
//  Created by Faryk on 13.12.2024.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var viewModel  = ExploreViewModel()
    
    var body: some View {
        TabView{
            ExploreView()
                .tabItem{
                    VStack{
                        Image(systemName: "magnifyingglass")
                         
                        Text("Search")
                    }
                }
                .tag(0)
            
            
            FavoritedCarsView()
                .tabItem{
                    VStack{
                        Image(systemName: "heart.fill")
                        Text("Favorites")
                    }
                }
                .tag(1)
            
            Text("Trips")
                .tabItem{
                    VStack{
                        Image(systemName: "road.lanes.curved.left")
                        Text("Trips")
                    }
                }
                .tag(2)
            
            
            Text("Profile")
                .tabItem{
                    VStack{
                        Image(systemName: "person.crop.circle.fill")
                        Text("Profile")
                    }
                }
                .tag(3)
        }
        .accentColor(.black)
        .onAppear(){
            UITabBar.appearance().backgroundColor = .white
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    MainTabView()
}
