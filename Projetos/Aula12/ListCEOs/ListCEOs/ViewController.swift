//
//  ViewController.swift
//  ListCEOs
//
//  Created by Matheus Lenke on 21/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    var personList: PersonList = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        registerCell()
        delegates()
    }
    
    private func updateUI() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Lista de CEOs"
        self.activityIndicatorView.startAnimating()
    }
    
    private func hideActivityIndicator() {
        self.activityIndicatorView.stopAnimating()
        self.activityIndicatorView.isHidden = true
    }
    
    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: PersonTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PersonTableViewCell.identifier)
    }
    
    private func loadData() {
        ApiService.shared.getPersonList { result in
            switch result {
            case .success(let personList):
                self.personList = personList
            case .failure(let error):
                print(error.localizedDescription)
                self.showErrorAlert(error: error.localizedDescription)
            }
            DispatchQueue.main.async {
                self.hideActivityIndicator()
            }
        }
    }
    
    private func showErrorAlert(error: String) {
        let alertController = UIAlertController(title: "Error!", message: error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertController, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell else { return UITableViewCell()}
        
        let person = personList[indexPath.row]
        cell.setup(person: person)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
}

