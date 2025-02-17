//
//  MealsApiManager.swift
//  Cafe
//
//  Created by Student on 14.02.25.
//


import Foundation

enum MealLinkType : Int{
    case french = 0
    case chinese
    case american
    var endPoint : String {
        switch self {
        case .french :
           return "a=American"
        case .chinese :
            return "a=French"
        case .american :
            return "a=Chinese"
        }
    }
}




protocol MealsApiManagerProtocol {
    func fetchMeals(with type : MealLinkType ,completion: @escaping (Result<MealResponse, Error>) -> ())
}

class MealsApiManager: MealsApiManagerProtocol {
    func fetchMeals(with type : MealLinkType,completion: @escaping (Result<MealResponse, Error>) -> ()) {
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
                let decodedData = try JSONDecoder().decode(MealResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))}
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
