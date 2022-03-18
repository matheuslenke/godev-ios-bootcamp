//
//  ViewController.swift
//  CollectionView
//
//  Created by Douglas Nunes on 14/03/22.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var collectionView: UICollectionView!
	
	let times = ["atletico-mg", "corinthians", "cruzeiro", "flamengo", "palmeiras", "santos"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		delegates()
		registerCell()
		collectionLayout()
		
		collectionView.showsHorizontalScrollIndicator = false
	}

	private func delegates() {
		collectionView.delegate = self
		collectionView.dataSource = self
	}
	
	private func registerCell() {
		let nib = UINib(nibName: ItemCollectionViewCell.identifier, bundle: nil)
		collectionView.register(nib, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
	}
	
	private func collectionLayout() {
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: 90, height: 90)
		layout.minimumLineSpacing = 10
		layout.scrollDirection = .horizontal
		collectionView.collectionViewLayout = layout
		
		
	}
	
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return times.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
	
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
		
		let time = times[indexPath.row]
		
		cell.setup(image: time)
		return cell
	}
	
}

extension ViewController: UICollectionViewDelegateFlowLayout {
	
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//		return CGSize(width: 100, height: 100)
//	}
}
