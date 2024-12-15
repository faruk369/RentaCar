//
//  ExploreViewModel.swift
//  RentaCar
//
//  Created by Faryk on 14.12.2024.
//

import SwiftUI

class ExploreViewModel: ObservableObject {
    @Published var mybrands: [Brands] = [
        Brands(id: UUID().uuidString, brandName: "BMW", imageName: "bmw", carIDs: []),
        Brands(id: UUID().uuidString, brandName: "Mercedes", imageName: "mercedes", carIDs: []),
        Brands(id: UUID().uuidString, brandName: "Jaguar", imageName: "jaguar", carIDs: []),
        Brands(id: UUID().uuidString, brandName: "Audi", imageName: "audi", carIDs: [])
    ]
}
