//
//  ViewController.swift
//  AppNetworking
//
//  Created by Matheus Lenke on 18/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var loading: UIActivityIndicatorView!
    
    lazy var users = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegates()
        getUsers()
    }
    
    private func delegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func getUsers() {
        showLoading()
        Service.shared.getUsers { result in
            switch result {
            case .success(let res):
                self.users = res
            case .failure(let error):
                print(error)
            }
            self.hideLoading()
        }
    }
    
    private func showLoading() {
        loading.startAnimating()
    }
    
    private func hideLoading() {
        DispatchQueue.main.async {
            self.loading.isHidden = true
            self.loading.stopAnimating()
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.company.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
}
