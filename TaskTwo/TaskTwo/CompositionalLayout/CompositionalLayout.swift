//
//  CompositionalLayout.swift
//  TaskTwo
//
//  Created by Softzino MBP 302 on 11/9/22.
//

import UIKit

enum CompositionalGroupAlignment {
    case vertical
    case horizontal
}

enum CompositionalLayout {
    static func createItem(width: NSCollectionLayoutDimension, height: NSCollectionLayoutDimension, spacing: CGFloat) -> NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: width,
                heightDimension: height
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)

        return item
    }

    static func createGroup(alignment: CompositionalGroupAlignment,
                            width: NSCollectionLayoutDimension,
                            heigh: NSCollectionLayoutDimension,
                            item: NSCollectionLayoutItem,
                            count: Int
    ) -> NSCollectionLayoutGroup
    {
        switch alignment {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: width,
                    heightDimension: heigh
                ),
                subitem: item,
                count: count
            )

        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: heigh), subitem: item,
                count: count
            )
        }
    }

    static func createGroup(alignment: CompositionalGroupAlignment, width: NSCollectionLayoutDimension, heigh: NSCollectionLayoutDimension, items: [NSCollectionLayoutItem]) -> NSCollectionLayoutGroup {
        switch alignment {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: heigh), subitems: items)

        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: heigh), subitems: items)
        }
    }
}
