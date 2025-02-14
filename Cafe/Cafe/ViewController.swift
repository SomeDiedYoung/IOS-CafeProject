//
//  ViewController.swift
//  Cafe
//
//  Created by Student on 14.02.25.
//

import UIKit

class ViewController: UIViewController {

    private var drinksManager : DrinksApiManagerProtocol?
    
    private var drinks : [Drink] = []{
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet private weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDrinks()
        setupTableView()
       
    }

    @IBAction
    func didTapDrinkType(_ sender: UISegmentedControl) {
      guard  let type = DrinkLinkType(rawValue: sender.selectedSegmentIndex)
        else {return}
        fetchDrinks(with: type)
    }
    
    private func setupTableView(){
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: "DrinkTableViewCell", bundle: nil),
            forCellReuseIdentifier: "DrinkTableViewCell"
        )
    }
    
    private func fetchDrinks(with type : DrinkLinkType = .cocktail){
        drinksManager = DrinksApiManager()
        
        drinksManager?.fetchDrinks(with: type,completion: {
            result in switch result {
            case .success(let drinksResponse):
                self.drinks = drinksResponse.drinks
            case .failure(let error) :
                print(error)
            }
        })
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drinks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkTableViewCell", for: indexPath) as? DrinkTableViewCell
        cell?.configure(with: drinks[indexPath.row])
        return cell ?? UITableViewCell()
        
    }
}
