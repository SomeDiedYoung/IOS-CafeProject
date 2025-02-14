//
//  MealModel.swift
//  Cafe
//
//  Created by Student on 14.02.25.
//

import Foundation



import Foundation

struct MealResponse : Decodable {
    let Meals : [Meal]
}

struct Meal : Decodable{
   let name : String
   let imageUrl: String
   let id: String
    
    enum CodingKeys : String , CodingKey{
        case name = "strMeal"
        case imageUrl = "strMealThumb"
        case id = "idMeal"
    }
}

