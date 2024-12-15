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
            ExploreView(viewmodel: viewModel)
                .tabItem{
                    VStack{
                        Image(systemName: "magnifyingglass")
                         
                        Text("Search")
                    }
                }
                .tag(0)
            
            Text("Favorite")
                .tabItem{
                    VStack{
                        Image(systemName: "heart.fill")
                        Text("Search")
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
            
            Text("Inbox")
                .tabItem{
                    VStack{
                        Image(systemName: "bubble.fill")
                        Text("Inbox")
                    }
                }
                .tag(3)
            
            
            Text("More")
                .tabItem{
                    VStack{
                        Image(systemName: "ellipsis")
                        Text("More")
                    }
                }
                .tag(4)
        }
        .accentColor(.black)
        .onAppear(){
            UITabBar.appearance().backgroundColor = .white
        }
    }
}

#Preview {
    MainTabView()
}
