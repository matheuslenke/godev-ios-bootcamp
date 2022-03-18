//
//  ViewController.swift
//  Navigation
//
//  Created by Matheus Lenke on 15/03/22.
//

import UIKit

struct Data {
    var name: String
    var age: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "View Controller"
    }

    @IBAction func goToSecondView(_ sender: UIButton) {
        let sender = Data(name: "Lenke", age: 23)
        
        performSegue(withIdentifier: "secondViewController", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondViewController" {
            
            if let secondViewController = segue.destination as? SecondViewController {
                
                guard let data = sender as? Data else { return }
                secondViewController.setData(data: data)
                print("Estou dentro da secondViewController")
            }
        }
    }
}

