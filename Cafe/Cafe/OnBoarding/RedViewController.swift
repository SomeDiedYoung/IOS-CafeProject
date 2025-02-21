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

        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

    @IBAction func didTapNext(_ sender: UIButton) {
        let vc = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBar")
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
