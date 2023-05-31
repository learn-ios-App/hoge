//
//  CostCategory.swift
//  CardAnimation
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import Foundation

struct Cost: Identifiable {
    let id = UUID()
    var goalCost: Int
    var usedCost: Int
    let category: CostCategory
}
