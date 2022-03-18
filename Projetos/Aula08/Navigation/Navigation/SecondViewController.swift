//
//  secondViewController.swift
//  Navigation
//
//  Created by Matheus Lenke on 15/03/22.
//

import UIKit

class SecondViewController: ViewController {
    
    private var property: Data?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let property = property {
            print("Recebendo propriedade: \(property.name) \(property.age)")
        }
    }
    
    func setData(data: Data) {
        self.property = data
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
