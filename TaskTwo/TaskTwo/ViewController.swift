//
//  ViewController.swift
//  TaskTwo
//
//  Created by Softzino MBP 302 on 11/9/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    private let items = [1, 1, 1, 1, 4, 4, 8]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        // item
        let item = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(1), spacing: 12)

        let horizontalGroup1 = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), heigh: .fractionalHeight(0.5), item: item, count: 2)
        let horizontalGroup2 = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), heigh: .fractionalHeight(0.5), item: item, count: 2)

        let smallGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(0.5), heigh: .fractionalHeight(1), items: [horizontalGroup1, horizontalGroup2])

        
        let MediumItem = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(0.5), heigh: .fractionalHeight(1), item: item, count: 1)

        let group = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), heigh: .fractionalHeight(0.33), items: [smallGroup, MediumItem])
        
        let MediumItem2 = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(0.5), heigh: .fractionalHeight(0.33), item: item, count: 1)
        
        let largeItem = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), heigh: .fractionalHeight(0.33), item: item, count: 1)
        
        let mainGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), heigh: .fractionalHeight(0.8), items: [group, MediumItem2, largeItem])

        // selection
        let section = NSCollectionLayoutSection(group: mainGroup)

        // return
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        let item = items[indexPath.row]
        if item == 1 {
            cell.setup(color: UIColor.green)
        } else if item == 4 {
            cell.setup(color: UIColor.red)
        } else if item == 8 {
            cell.setup(color: UIColor.cyan)
        }
        
        return cell
    }
}

class ItemCell: UICollectionViewCell {
    @IBOutlet var view: UIView!
    
    func setup(color: UIColor) {
        view.backgroundColor = color
        view.layer.cornerRadius = 10
    }
}
