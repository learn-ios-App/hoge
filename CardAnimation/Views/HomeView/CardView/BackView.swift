//
//  BackView.swift
//  CardAnimation
//
//  Created by 渡邊魁優 on 2023/05/29.
//

import SwiftUI

struct BackView: View {
    @EnvironmentObject var cardViewModel: CardData
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(width: 300, height: 200)
            .shadow(radius: 5)
            .overlay(
                VStack {
                    VStack {
                        Spacer()
                        Text("使える金額")
                            .opacity(0.5)
                        Spacer()
                        Text("\(cardViewModel.available)円")
                            .font(.largeTitle)
                        Spacer()
                    }
                    .rotationEffect(.degrees(180))
                    .scaleEffect(x: -1, y: 1, anchor: .center)
                }
            )
    }
}

struct BackView_Previews: PreviewProvider {
    static var previews: some View {
        BackView()
            .environmentObject(CardData())
    }
}
