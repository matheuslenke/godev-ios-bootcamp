//
//  ViewController.swift
//  AppCoreData
//
//  Created by Matheus Lenke on 17/03/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    var people: [Person] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        people = ManagedObjectContext.shared.getPerson()
        delegates()
    }
    
    private func delegates() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    @IBAction func pressedGet(_ sender: UIButton) {
        people = ManagedObjectContext.shared.getPerson()
        tableView.reloadData()
        print(people)
    }
    
    @IBAction func pressetSave(_ sender: UIButton) {
        let person = Person(id: UUID(), name: "Matheus", lastName: "Lenke", age: 23)
        ManagedObjectContext.shared.save(person: person ) { message in
            print(message)
        }
    }
    
    @IBAction func pressedDelete(_ sender: UIButton) {
        
        let id = "5D1E4A12-7AAC-4DD1-8441-5AA8C015886B"
        
        ManagedObjectContext.shared.delete(uuid: id) { result in
            print(result)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let actualPerson = people[indexPath.row]
        cell.textLabel?.text = "\(actualPerson.name) \(actualPerson.lastName)"
        cell.detailTextLabel?.text = "\(actualPerson.age)"
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
}

