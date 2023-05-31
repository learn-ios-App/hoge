//
//  ListRow.swift
//  CardAnimation
//
//  Created by 渡邊魁優 on 2023/05/29.
//

import SwiftUI

struct ListRow: View {
    @State var item: Item
    var body: some View {
        VStack {
            HStack {
                Text(item.title)
                Spacer()
                Text("\(item.price)円")
                Image(systemName: "i.circle")
                    .foregroundColor(.blue)
            }
            .font(.title3)
            .padding()
            HStack {
                Image(systemName: "app.fill")
                    .foregroundColor(item.category.color)
                Text(item.category.title)
            }
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(item: Item(title: "ゴルフ", price: 15000, category: CostCategory.entertainment))
    }
}
