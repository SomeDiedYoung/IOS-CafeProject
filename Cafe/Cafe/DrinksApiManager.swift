//
//  DrinksApiManager.swift
//  Cafe
//
//  Created by Student on 14.02.25.
//
import Foundation

enum DrinkLinkType{
    case alcoholic // my future xD
    case nonAlcoholic // if i quit cs (i love cs)
    case cocktail // if i`ll be succeed
    var endPoint : String {
        switch self {
        case .alcoholic :
           return "a=Alcoholic"
        case .nonAlcoholic :
            return "a=a=Non_Alcoholic"
        case .cocktail :
            return "c=Cocktail"
        }
    }
}




protocol DrinksApiManagerProtocol {
    func fetchDrinks(with type : DrinkLinkType ,completion: @escaping (Result<DrinkResponse, Error>) -> ())
}

class DrinksApiManager: DrinksApiManagerProtocol {
    func fetchDrinks(with type : DrinkLinkType,completion: @escaping (Result<DrinkResponse, Error>) -> ()) {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?\(type.endPoint)"
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                print(error)
                return
            }
            guard let data = data else {
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(DrinkResponse.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
