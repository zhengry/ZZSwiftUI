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
    @State var showProfile = false
    
    var body: some View {
        
        ZStack {
            
            HomeList()
                .blur(radius: showMenu ? 20 : 0)
                .scaleEffect(showProfile ? 0.95 : 1)
                .animation(.default)
            ContentView()
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y:showProfile ? 0 : UIScreen.main.bounds.height)

            MenuButton(show: $showMenu)
                .offset(x: -40,y: showProfile ? 0 : 88)
                .animation(.interactiveSpring())
            MenuRight(showMenu: $showProfile)
                .offset(x: -16, y: showProfile ? 0 : 88)
                .animation(.interactiveSpring())
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

struct CircleButton:View {
    var icon = "person.crop.circle"
    
    
    var body: some View {
        HStack{
            Image(systemName: icon)
                .foregroundColor(.black)
        }
        .frame(width:44,height: 44)
        .background(Color.white)
        .cornerRadius(22)
        .shadow(radius: 10)
    }
    
}

struct MenuButton:View {
    
    @Binding var show:Bool
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: { self.show.toggle()}) {
                    HStack{
                        Spacer()
                        Image(systemName: "list.dash")
                            .foregroundColor(.black)
                    }
                    .padding(.trailing,10)
                    .frame(width:90,height: 60)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(radius: 10)
                }
                Spacer()
            }
            Spacer()
        }
        
    }
    
}

struct MenuRight:View {
    
    @Binding var showMenu:Bool
    
    var body:some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {self.showMenu.toggle()}) {
                    CircleButton(icon: "person.crop.circle")
                }
                Button(action: {
                    self.showMenu.toggle()
                }) {
                    CircleButton(icon: "bell")
                }
            }
            Spacer()
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
