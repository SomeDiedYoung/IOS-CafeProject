//
//  YellowsViewController.swift
//  Cafe
//
//  Created by Student on 19.02.25.
//

import UIKit

class YellowsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: true)

    }
    

    @IBAction func didtabNextPage(_ sender: UIButton) {
        let vc = UIStoryboard(name: "OnboardingPages", bundle: nil).instantiateViewController(withIdentifier: "GreenViewController")
        navigationController?.pushViewController(vc, animated: true)
        
    }

}
