//
//  CategoryCardData.swift
//  CardAnimation
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import Foundation

class CategoryCardData: ObservableObject {
    
    @Published var costs: [Cost] = [
        Cost(goalCost: 0, usedCost: 0, category: CostCategory.food),
        Cost(goalCost: 0, usedCost: 0, category: CostCategory.transportation),
        Cost(goalCost: 0, usedCost: 0, category: CostCategory.entertainment),
        Cost(goalCost: 0, usedCost: 0, category: CostCategory.medicalAndCosme),
        Cost(goalCost: 0, usedCost: 0, category: CostCategory.livingware),
        Cost(goalCost: 0, usedCost: 0, category: CostCategory.others)
    ]
    
    func plusCost(item: Item) {
        switch item.category {
        case .food:
            self.costs[0].usedCost += item.price
        case .transportation:
            self.costs[1].usedCost += item.price
        case .entertainment:
            self.costs[2].usedCost += item.price
        case .medicalAndCosme:
            self.costs[3].usedCost += item.price
        case .livingware:
            self.costs[4].usedCost += item.price
        case .others:
            self.costs[5].usedCost += item.price
        }
    }
    
    func setGoalCost(item: Item) {
        switch item.category {
        case .food:
            self.costs[0].goalCost += item.price
        case .transportation:
            self.costs[1].goalCost += item.price
        case .entertainment:
            self.costs[2].goalCost += item.price
        case .medicalAndCosme:
            self.costs[3].goalCost += item.price
        case .livingware:
            self.costs[4].goalCost += item.price
        case .others:
            self.costs[5].goalCost += item.price
        }
    }
}
