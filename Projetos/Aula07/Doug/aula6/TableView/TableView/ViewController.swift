//
//  ViewController.swift
//  TableView
//
//  Created by Douglas Nunes on 13/03/22.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableview: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		delegates()
	}

	private func delegates() {
		tableview.delegate = self
		tableview.dataSource = self
	}

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(indexPath.row)
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 30
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		
		cell.textLabel?.text = "Doug"
		cell.detailTextLabel?.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it "
		
		cell.imageView?.image = UIImage(systemName: "keyboard.fill")
		
		return cell
	}
	
	
	
}
