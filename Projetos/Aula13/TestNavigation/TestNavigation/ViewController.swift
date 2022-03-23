//
//  ViewController.swift
//  TestNavigation
//
//  Created by Matheus Lenke on 22/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .orange
        title = "App 1"
    }


    @IBAction func pressedGetApp2(_ sender: UIButton) {
        
        let customUrl = "NavigationSchemes://product/789787474/page/description"
    
        
        if let url = URL(string: customUrl) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
}

