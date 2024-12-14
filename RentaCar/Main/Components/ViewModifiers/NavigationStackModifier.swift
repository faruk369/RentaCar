//
//  NavigationStackModifier.swift
//  RentaCar
//
//  Created by Faryk on 14.12.2024.
//

import SwiftUI

struct NavigationStackModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("Find Cars", displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Circle()
                        .fill(.black.opacity(0.1))
                        .frame(width: 45, height: 45)
                        .overlay{
                            Image(systemName: "bell.fill")
                                .foregroundStyle(.black)
                        }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Image("dwight")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .scaledToFill()
                        .clipShape(Circle())
                }
            }
    }
   
}

extension View{
    func navigationStackModifier() -> some View {
        modifier(NavigationStackModifier())
    }
}
