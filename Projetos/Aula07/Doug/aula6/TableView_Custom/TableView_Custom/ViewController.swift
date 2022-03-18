//
//  ViewController.swift
//  TableView_Custom
//
//  Created by Douglas Nunes on 13/03/22.
//

import UIKit

struct Times {
	var logo: String
	var name: String
	var description: String
}

class ViewController: UIViewController {

	@IBOutlet weak var tableview: UITableView!
	
	var times: [Times] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Times"
		
		delegates()
		
		times = [Times(logo: "atletico-mg", name: "ATletico Mineiro", description: "O Clube Atlético Mineiro é um clube brasileiro de futebol sediado na cidade de Belo Horizonte, Minas Gerais. Foi fundado em 25 de março de 1908 por um grupo de estudantes, tem como suas cores tradicionais o preto e o branco."),
				 Times(logo: "corinthians", name: "Corinthians", description: "Sport Club Corinthians Paulista é um clube poliesportivo brasileiro da cidade de São Paulo, capital do estado de São Paulo. Foi fundado como uma equipe de futebol no dia 1 de setembro de 1910 por um grupo de operários do bairro Bom Retiro."),
				 Times(logo: "cruzeiro", name: "Cruzeiro", description: "O Cruzeiro Esporte Clube é uma associação polidesportiva brasileira, com sede em Belo Horizonte, Minas Gerais. É considerado um dos maiores clubes de futebol do Brasil e da América do Sul"),
				 Times(logo: "flamengo", name: "Flamengo", description: "O Clube de Regatas do Flamengo é uma agremiação poliesportiva brasileira com sede na cidade do Rio de Janeiro, capital do estado de mesmo nome."),
				 Times(logo: "palmeiras", name: "Palmeiras", description: "Sociedade Esportiva Palmeiras é um clube poliesportivo brasileiro da cidade de São Paulo, capital do estado homônimo. Foi fundado em 26 de agosto de 1914 e suas cores, presentes no escudo e bandeira oficial, são o verde e branco."),
				 Times(logo: "santos", name: "Santos", description: "Santos Futebol Clube é um clube poliesportivo brasileiro da cidade de Santos, São Paulo. Foi fundado em 14 de abril de 1912, suas cores iniciais seriam o branco, azul e dourado, mas um ano após a sua fundação, ficou decidido que as cores do clube passariam a ser branco e preto.")]
	}
	
	private func delegates() {
		tableview.dataSource = self
	}
	

}

extension ViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return times.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else {
			return UITableViewCell()
		}
		
		let time = times[indexPath.row]
		
		cell.setup(logo: time.logo, name: time.name, description: time.description)
		
		return cell
	}
}



