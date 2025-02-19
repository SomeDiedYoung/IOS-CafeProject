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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapNextPage(_ sender: UIButton) {
        let vc = UIStoryboard(name: "RedViewController", bundle: nil).instantiateViewController(withIdentifier: "RedViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
}
