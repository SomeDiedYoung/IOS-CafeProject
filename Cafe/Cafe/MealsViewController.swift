//
//  MealsViewController.swift
//  Cafe
//
//  Created by Student on 14.02.25.
//

import UIKit

class MealsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private var mealsManager : MealsApiManagerProtocol?
    
    private var meals : [Meal] = []{
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchMeals()
        setupTableView()
    }

    @IBAction func didTapMealType(_ sender: UISegmentedControl) {
        guard let type = MealLinkType(rawValue: sender.selectedSegmentIndex) else {return}
        fetchMeals(with:type)
    }
    
    private func setupTableView(){
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MealTableViewCell", bundle: nil), forCellReuseIdentifier: "MealTableViewCell")
    }
    private func fetchMeals(with type : MealLinkType = .chinese){
        mealsManager = MealsApiManager()
        mealsManager?.fetchMeals(with: type,completion: {
            result in switch result {
            case .success(let mealsResponse):
                self.meals = mealsResponse.meals
            case .failure(let error) :
                print(error)
            }
        })
    }
    
}
extension MealsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell", for: indexPath) as? MealTableViewCell
        cell?.configure(with: meals[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

