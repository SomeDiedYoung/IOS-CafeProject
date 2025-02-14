//
//  Drink.swift
//  Cafe
//
//  Created by Student on 14.02.25.
//

import Foundation

struct DrinkResponse : Decodable {
    let drinks : [Drink]
}

struct Drink : Decodable{
   let name : String
   let imageUrl: String
   let id: String
    
    enum CodingKeys : String , CodingKey{
        case name = "strDrink"
        case imageUrl = "strDrinkThumb"
        case id = "idDrink"
    
        
    }
}

