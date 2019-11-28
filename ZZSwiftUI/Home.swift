//
//  Home.swift
//  ZZSwiftUI
//
//  Created by zry on 2019/11/28.
//  Copyright © 2019 ZRY. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State var showMenu = false
    
    var body: some View {
        
        ZStack {
            
            Button("Open Menu") {
                self.showMenu.toggle()
            }
            MenuView(show: $showMenu)
            
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRow:View {
    var image = "creditcard"
    var text = "My Account"
    
    var body : some View {
        return HStack {
            Image(systemName: image)
                .imageScale(.medium)
                .foregroundColor(.blue)
                .frame(width: 32, height: 32, alignment: .center)
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}

struct MenuView:View {
    let menu = menuData
    @Binding var show:Bool
    
    var body:some View {
        VStack(alignment: .leading,spacing: 20) {
            ForEach(menu) { item in
                MenuRow(image: item.icon, text: item.title)
            }
            Spacer()
        }
            .padding(.top, 20)
            .padding(30)// 在frame之前设置，这个Padding会应用到frame上，也就是当前视图的内边距
            .frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: nil, idealHeight: nil, maxHeight: nil, alignment: .leading)
            .background(Color.white)
            .cornerRadius(30)
            .padding(.trailing, 60)//在frame和CornerRadius之后设置,是frame相对屏幕视图的内边距
            .shadow(radius: 20)
            .offset(x: show ? 0 : -UIScreen.main.bounds.width, y: 0)
            .animation(.default)
            .onTapGesture {
                self.show.toggle()
            }
    }
    
}

struct Menu:Identifiable {
    var id = UUID()
    var title:String
    var icon:String
    
}


let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Sign out", icon: "arrow.uturn.down")
]
