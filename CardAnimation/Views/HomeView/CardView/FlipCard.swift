//
//  ContentView.swift
//  CardAnimation
//
//  Created by 渡邊魁優 on 2023/05/29.
//

import SwiftUI

struct FlipCard: View {
    @EnvironmentObject var cardViewModel: CardData
    var body: some View {
        ZStack {
            FrontView()
            // isFlippedがtrueの場合、透明度を0（非表示）に、falseの場合は1（表示）にする
                .opacity(cardViewModel.isFlipped ? 0 : 1)
            
            BackView()
                .opacity(cardViewModel.isFlipped ? 1 : 0)
        }
        // 3D回転アニメーションを適用。isFlippedがtrueの場合、180度回転させ、falseの場合は0度にする
        .rotation3DEffect(.degrees(cardViewModel.isFlipped ? 180 : 0),
                          axis: (x: 1, y: 0, z: 0))
        // アニメーションの設定。値が変更されたときにアニメーションを実行
        .animation(.spring(response: 0.7, dampingFraction: 0.6, blendDuration: 0), value: cardViewModel.isFlipped)
        .onTapGesture {
            cardViewModel.didTapCard()
        }
        
    }
}

struct FripCard_Previews: PreviewProvider {
    static var previews: some View {
        FlipCard()
            .environmentObject(CardData())
    }
}
