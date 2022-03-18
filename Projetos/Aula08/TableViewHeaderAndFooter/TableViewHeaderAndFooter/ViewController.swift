//
//  ViewController.swift
//  TableViewHeaderAndFooter
//
//  Created by Matheus Lenke on 15/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        registerCell()
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200))
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200))
        
        header.backgroundColor = .orange
        footer.backgroundColor = .blue
        
        tableView.tableHeaderView = header
        tableView.tableFooterView = header
    }

    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
