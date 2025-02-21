//
//  GreenViewController.swift
//  Cafe
//
//  Created by Student on 19.02.25.
//

import UIKit

class GreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func didTapNextPage(_ sender: UIButton) {
        let vc = UIStoryboard(name: "OnboardingPages", bundle: nil).instantiateViewController(withIdentifier: "RedViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
}
