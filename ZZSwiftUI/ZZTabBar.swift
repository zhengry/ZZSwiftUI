//
//  ZZTabBar.swift
//  ZZSwiftUI
//
//  Created by zry on 2019/11/30.
//  Copyright © 2019 ZRY. All rights reserved.
//

import SwiftUI

struct ZZTabBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                VStack{
                    Image(systemName: "house")
                    Text("首页")
                }
            }
            UpdateList().tabItem {
                VStack{
                    Image(systemName: "list.dash")
                    Text("列表")
                }
            }
            ContentView().tabItem {
                VStack {
                    Image(systemName: "pencil.and.outline")
                    Text("内容")
                }
            }
        }
    }
}

struct ZZTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ZZTabBar()
    }
}
