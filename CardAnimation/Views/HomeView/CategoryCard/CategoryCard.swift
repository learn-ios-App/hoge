//
//  CategoryCard.swift
//  CardAnimation
//
//  Created by 渡邊魁優 on 2023/05/30.
//

import SwiftUI

struct CategoryCard: View {
    @EnvironmentObject var categoryCardViewModel: CategoryCardData
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(width: 300, height: 800)
            .shadow(radius: 5)
            .overlay(
                VStack(spacing: 50) {
                    Text("使った金額")
                        .opacity(0.5)
                    ForEach(categoryCardViewModel.costs) { cost in
                        VStack(spacing: 15) {
                            HStack {
                                Image(systemName: "app.fill")
                                    .foregroundColor(cost.category.color)
                                Text(cost.category.title)
                            }
                            HStack {
                                Text("\(cost.usedCost)円")
                                    .font(.title)
                            }
                        }
                    }
                }
            )
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard()
            .environmentObject(CategoryCardData())
    }
}
