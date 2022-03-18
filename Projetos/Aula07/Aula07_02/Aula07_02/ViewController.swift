//
//  ViewController.swift
//  Aula07_02
//
//  Created by Matheus Lenke on 14/03/22.
//

import UIKit

struct Time {
    var logo: String
    var name: String
    var description: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var times: [Time] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        times.append(Time(logo: "keyboard", name: "Time 1", description: "Descrição!"))
        times.append(Time(logo: "keyboard", name: "Time 2", description: "Descrição!"))
        times.append(Time(logo: "keyboard", name: "Time 3", description: "Descrição!"))
        times.append(Time(logo: "keyboard", name: "Time 4", description: "Descrição!"))
        times.append(Time(logo: "keyboard", name: "Time 5", description: "Descrição!"))
        
        delegates()
    }

    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Eu cliquei no time: \(times[indexPath.row].name)")
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}
        let time = times[indexPath.row]
        
        cell.setup(logo: time.logo, name: time.name, description: time.description)
        
        return cell
    }
}
