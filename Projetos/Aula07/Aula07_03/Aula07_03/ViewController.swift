//
//  ViewController.swift
//  Aula07_03
//
//  Created by Matheus Lenke on 14/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    let times = ["atletico-mg", "corinthians", "cruzeiro", "flamengo", "palmeiras"]
    
    @IBOutlet weak var collection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        registerCell()
        collectionLayout()
        
        collection.showsHorizontalScrollIndicator = false
    }
    
    private func delegates() {
        collection.delegate = self
        collection.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: ItemCollectionViewCell.identifier, bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
    }
    
    private func collectionLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.size.width, height: 200)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        collection.collectionViewLayout = layout
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Eu cliquei no item \(indexPath.item)")
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return times.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell()}
        
        let time = times[indexPath.row]
        cell.setup(image: "keyboard")
        
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}
