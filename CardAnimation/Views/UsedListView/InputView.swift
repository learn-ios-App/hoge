//
//  InputView.swift
//  CardAnimation
//
//  Created by 渡邊魁優 on 2023/05/29.
//

import SwiftUI

struct InputView: View {
    @EnvironmentObject var cardViewModel: CardData
    @EnvironmentObject var categoryCardViewModel: CategoryCardData
    
    @State private var title: String = ""
    @State private var price: String = ""
    @State private var detail: String = ""
    @State private var category: CostCategory = CostCategory.others
    
    let cancel: () -> Void
    let save: (Item) -> Void
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("タイトル", text: $title)
                        .keyboardType(.default)
                    ZStack {
                        TextField("金額 (円)", text: $price)
                            .keyboardType(.numbersAndPunctuation)
                    }
                }
                
                Section {
                    Picker("カテゴリー", selection: $category) {
                        Text("食費").tag(CostCategory.food)
                        Text("交通費").tag(CostCategory.transportation)
                        Text("娯楽").tag(CostCategory.entertainment)
                        Text("医薬品・コスメ").tag(CostCategory.medicalAndCosme)
                        Text("生活用品").tag(CostCategory.livingware)
                        Text("その他").tag(CostCategory.others)
                    }
                }
                
                Section {
                    ZStack(alignment: .topLeading) {
                        if detail.isEmpty {
                            Text("詳細")
                                .foregroundColor(.gray)
                                .padding(.top, 8)
                                .padding(.leading, 8)
                        }
                        TextEditor(text: $detail)
                            .frame(height: 150)
                            .keyboardType(.default)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        cancel()
                    }) {
                        Text("キャンセル")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        do {
                            let item = try createItem()
                            save(item)
                            cardViewModel.updataUsed(price: item.price)
                            categoryCardViewModel.plusCost(item: item)
                        } catch {
                            let error = error as! InputError
                            print(error.title)
                        }
                    }) {
                        Text("追加")
                    }
                }
            }
            .navigationTitle("新規作成")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    private func createItem() throws -> Item {
        guard !title.isEmpty else {
            throw InputError.emptyTitle
        }
        guard let price = Int(price) else {
            throw InputError.wrongPrice
        }
        let item = Item(title: title, price: price, category: category)
        return item
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(cancel: {}, save: { _ in })
            .environmentObject(CardData())
            .environmentObject(CategoryCardData())
    }
}
