//
//  HomeVC.swift
//  CVDemos
//
//  Created by Shuvo on 8/30/17.
//  Copyright © 2017 Shuvo. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func goNext(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "AppleNewsVC")
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
