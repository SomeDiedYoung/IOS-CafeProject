//
//  RedViewController.swift
//  Cafe
//
//  Created by Student on 19.02.25.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapNext(_ sender: UIButton) {
        let vc = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
