//
//  FrontView.swift
//  CardAnimation
//
//  Created by 渡邊魁優 on 2023/05/29.
//

import SwiftUI

struct FrontView: View {
    @EnvironmentObject var cardViewModel: CardData
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(width: 300, height: 200)
            .shadow(radius: 5)
            .overlay(
                VStack(spacing: 20) {
                    VStack {
                        Spacer()
                        Text("目標金額")
                            .opacity(0.5)
                        Spacer()
                        Text("\(cardViewModel.goalMoney)円")
                            .font(.largeTitle)
                        Spacer()
                    }
                    VStack {
                        Spacer()
                        Text("使った金額")
                            .opacity(0.5)
                        Spacer()
                        Text("\(cardViewModel.usedMoney)円")
                            .font(.largeTitle)
                        Spacer()
                    }
                }
            )
    }
}

struct FrontView_Previews: PreviewProvider {
    static var previews: some View {
        FrontView()
            .environmentObject(CardData())
    }
}
