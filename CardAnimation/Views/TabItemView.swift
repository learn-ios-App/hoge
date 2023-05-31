//
//  TabView.swift
//  CardAnimation
//
//  Created by 渡邊魁優 on 2023/05/30.
//

import SwiftUI

struct TabItemView: View {
    
    enum Tabs: String, CaseIterable, Identifiable {
        case home = "ホーム"
        case input = "入力"
        case charts = "情報"
        case setting = "設定"
        
        var id: Self { self }
    }
    
    @State private var navigationTitle: String = Tabs.home.rawValue
    @State private var selectionTab: Tabs = .home
    
    @EnvironmentObject var cardViewModel: CardData
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectionTab) {
                HomeView()
                    .tabItem {
                        VStack {
                            Image(systemName: "house")
                            Text("ホーム")
                        }
                    }
                    .tag(Tabs.home)
                
                ItemListView()
                    .tabItem {
                        VStack {
                            Image(systemName: "note.text")
                            Text("詳細")
                        }
                    }
                    .tag(Tabs.input)
                
                Text("二つ目の画面")
                    .tabItem {
                        VStack {
                            Image(systemName: "chart.bar")
                            Text("データ")
                        }
                    }
                    .tag(Tabs.charts)
                
                SettingView()
                    .tabItem {
                        VStack {
                            Image(systemName: "gearshape")
                            Text("設定")
                        }
                    }
                    .tag(Tabs.setting)
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: selectionTab) { tab in
                navigationTitle = selectionTab.rawValue
            }
            .onAppear(perform: cardViewModel.onAppear)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabItemView()
            .environmentObject(CardData())
            .environmentObject(CategoryCardData())
    }
}
