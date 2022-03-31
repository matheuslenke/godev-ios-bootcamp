//
//  ViewController.swift
//  Marvel
//
//  Created by Matheus Lenke on 30/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    var items: Hero?
    private let apiService: HeroListServiceProtocol?

    init(heroApiService: HeroListServiceProtocol) {
        self.apiService = heroApiService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        
        apiService?.execute { result in
            switch result {
            case .success(let hero):
                self.items = hero
                print("Total de elementos: \(self.items?.data?.results?.count)")
                print(self.items)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


}

