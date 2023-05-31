//
//  Item.swift
//  CardAnimation
//
//  Created by 渡邊魁優 on 2023/05/29.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    var title: String
    var price: Int
    var category: CostCategory
}

