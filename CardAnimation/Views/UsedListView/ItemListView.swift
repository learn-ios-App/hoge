//
//  ItemListView.swift
//  CardAnimation
//
//  Created by 渡邊魁優 on 2023/05/29.
//

import SwiftUI

struct ItemListView: View {
    @StateObject var itemViewModel = ItemData()
    var body: some View {
        NavigationStack {
            ZStack {
                if itemViewModel.itemList.isEmpty {
                    Image("backImage")
                        .resizable()
                        .scaledToFit()
                } else {
                    List {
                        ForEach(itemViewModel.itemList) { item in
                            ListRow(item: item)
                        }
                        .onDelete(perform: itemViewModel.delete)
                    }
                    .listStyle(InsetListStyle())
                }
                
                PlusButton(active: { itemViewModel.didTapPlusButton() })
            }
            .sheet(isPresented: $itemViewModel.isAddView) {
                InputView(cancel: itemViewModel.didTapCancelButton,
                          save: itemViewModel.didTapSaveButton)
            }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
