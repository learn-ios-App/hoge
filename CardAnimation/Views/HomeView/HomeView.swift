//
//  HomeView.swift
//  CardAnimation
//
//  Created by 渡邊魁優 on 2023/05/30.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView() {
                VStack(spacing: 30) {
                    Spacer()
                    FlipCard()
                    CategoryCard()
                }
                .padding(.horizontal, 50)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CardData())
            .environmentObject(CategoryCardData())
    }
}
