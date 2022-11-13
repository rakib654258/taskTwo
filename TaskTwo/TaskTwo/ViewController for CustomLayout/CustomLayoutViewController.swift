//
//  CustomLayoutViewController.swift
//  TaskTwo
//
//  Created by Softzino MBP 302 on 11/12/22.
//

import UIKit

class CustomLayoutViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
//    private let items = [1, 1, 1, 1, 4, 4, 8]
    private let items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self

        let customLayout = CustomLayout()
        customLayout.delegate = self
        customLayout.numberOfColumns = 3
        customLayout.cellPadding = 2
        collectionView.collectionViewLayout = customLayout
    }
}

extension CustomLayoutViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomLayoutItemCell", for: indexPath) as! CustomLayoutItemCell

        let item = items[indexPath.row]
        cell.setup(img: "\(item)", color: UIColor.green, number: item)
//        if item == 1 {
//            cell.setup(img: "\(item)", color: UIColor.green, number: item)
//        } else if item == 4 {
//            cell.setup(img: "\(item)", color: UIColor.red, number: item)
//        } else if item == 8 {
//            cell.setup(img: "\(item)", color: UIColor.cyan, number: item)
//        }

        return cell
    }
}

extension CustomLayoutViewController: CustomLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, sizeOfContentAtIndexPath indexPath: IndexPath) -> CGSize {
//        if items[indexPath.row] == 1 {
//            let size = collectionView.bounds.width / 4
//            return CGSize(width: size, height: size)
//        } else if items[indexPath.row] == 4 {
//            let size = collectionView.bounds.width / 2
//            return CGSize(width: size, height: size)
//        } else if items[indexPath.row] == 8{
//            let size = collectionView.bounds.width
//            return CGSize(width: size, height: 100)
//        } else {
//            return CGSize(width: 50, height: 50)
//        }
        
        return UIImage(named: "\(items[indexPath.item])")!.size
        
    }
}

class CustomLayoutItemCell: UICollectionViewCell {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var img: UIImageView!
    
    func setup(img: String ,color: UIColor, number: Int) {
        self.img.image = UIImage(named: img)
//        bgView.backgroundColor = color
        self.number.text = "\(number)"
    }
}
