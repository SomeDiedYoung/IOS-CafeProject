//
//  ViewController.swift
//  Cafe
//
//  Created by Student on 14.02.25.
//

import UIKit

class ViewController: UIViewController {

    private var drinksManager : DrinksApiManagerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drinksManager = DrinksApiManager()
        drinksManager?.fetchDrinks(with: .cocktail,completion: {
            result in switch result {
            case .success(let drinksResponse):
                print(drinksResponse)
            case .failure(let error) :
                print(error)
            }
        })
    }


}

