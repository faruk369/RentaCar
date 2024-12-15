//
//  Brands.swift
//  RentaCar
//
//  Created by Faryk on 14.12.2024.
//

import Foundation

struct Brands: Identifiable,Hashable, Codable {
    
    let id: String
    let brandName: String
    let imageName: String
    var carIDs: [String]
    
    
}
