//
//  ItemData.swift
//  CardAnimation
//
//  Created by 渡邊魁優 on 2023/05/29.
//

import Foundation

class ItemData: ObservableObject {
    @Published var itemList: [Item] = []
    @Published var isAddView = false
    
    func delete(offset: IndexSet) {
        itemList.remove(atOffsets: offset)
    }
    
    func didTapSaveButton(item: Item) {
        itemList.append(item)
        isAddView = false
    }
    
    func didTapPlusButton() {
        isAddView = true
    }
    
    func didTapCancelButton() {
        isAddView = false
    }
}
