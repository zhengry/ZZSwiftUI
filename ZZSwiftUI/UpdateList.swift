//
//  UpdateList.swift
//  ZZSwiftUI
//
//  Created by zry on 2019/11/29.
//  Copyright © 2019 ZRY. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    var body: some View {
        
        NavigationView {
            List(updateItems){ item in
                NavigationLink(destination: UpdateDetail(title: item.title, image: item.icon, content: item.content, color: item.color)) {
                    HStack(spacing:12) {
                        Image(systemName: item.icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .frame(width: 100, height: 100)
                            .background(Color.primary)
                            .cornerRadius(20)
                            .foregroundColor(item.color)
                            
                            
                        VStack(alignment: .leading, spacing: 10) {
                            Text(item.title)
                                .font(.headline)
                            Text(item.content)
                                .lineLimit(2)
                            Text(item.date)
                                .foregroundColor(.gray)
                        }
                    }
                }            
            }
            .navigationBarTitle(Text("Update List").font(.title).fontWeight(.bold))
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}


struct UpdateItem:Identifiable {
    var id = UUID()
    var title:String
    var icon:String
    var content:String
    var date:String
    var color:Color
    
}

let updateItems = [
    UpdateItem(title: "学习Swift",
               icon: "pencil.and.outline",
               content: "今天是学习Swift的好日子呢",
               date: "2019-10-12",
               color:Color.orange
    ),
    UpdateItem(title: "学习SwiftUI",
               icon: "signature",
               content: "SwiftUI的API变化好快呢，要及时更新自己的知识库啊",
               date: "2019-10-16",
               color:Color.purple
    ),
    UpdateItem(title: "巩固FLutter",
               icon: "dollarsign.circle",
               content: "Flutter虽然上手很快，但还是需要继续努力啊",
               date: "2019-11-12",
               color: Color.blue
    ),
    UpdateItem(title: "快速掌握CSS",
               icon: "yensign.circle",
               content: "CSS教程你值得拥有",
               date: "2019-12-12",
               color:Color.red
    ),
    UpdateItem(title: "学习Swift",
               icon: "timer",
               content: "今天是学习Swift的好日子呢",
               date: "2019-10-12",
               color:Color.green
    ),
    UpdateItem(title: "学习SwiftUI",
               icon: "heart.circle",
               content: "SwiftUI的API变化好快呢，要及时更新自己的知识库啊",
               date: "2019-10-16",
               color:Color.green
    ),
    UpdateItem(title: "巩固FLutter",
               icon: "staroflife",
               content: "Flutter虽然上手很快，但还是需要继续努力啊",
               date: "2019-11-12",
               color:Color.pink
    ),
    UpdateItem(title: "快速掌握CSS",
               icon: "c.circle",
               content: "CSS教程你值得拥有",
               date: "2019-12-12",
               color:Color.orange
    )

]
