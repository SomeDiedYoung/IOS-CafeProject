//
//  MealsViewController.swift
//  Cafe
//
//  Created by Student on 14.02.25.
//

import UIKit

class MealsViewController: UIViewController {

    private var MealsManager : MealsApiManagerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MealsManager = MealsApiManager()
        MealsManager?.fetchMeals(with: .american,completion: {
            result in switch result {
            case .success(let MealsResponse):
                print(MealsResponse)
            case .failure(let error) :
                print(error)
            }
        })
    }



}
