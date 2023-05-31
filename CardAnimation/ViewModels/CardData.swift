//
//  SampleData.swift
//  CardAnimation
//
//  Created by 渡邊魁優 on 2023/05/29.
//

import Foundation

class CardData: ObservableObject {
    static var used: Int = 0
    static var goal: Int = 50000
    
    @Published var goalMoney: Int = 0
    @Published var usedMoney: Int = 0
    @Published var available: Int = 0
    @Published var isFlipped = false
    
    func updataGoal(goal: Int) {
        Self.goal = goal
    }
    
    func updataUsed(price: Int) {
        Self.used += price
        updataCard()
    }
    
    func clearUsed() {
        Self.used = 0
        updataCard()
    }
    
    func onAppear() {
        updataCard()
    }
    
    private func updataCard() {
        goalMoney = Self.goal
        usedMoney = Self.used
        available = Self.goal - Self.used
    }
    
    func didTapCard() {
        isFlipped.toggle()
    }
}
