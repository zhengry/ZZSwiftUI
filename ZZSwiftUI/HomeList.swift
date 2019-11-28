//
//  HomeList.swift
//  ZZSwiftUI
//
//  Created by zry on 2019/11/28.
//  Copyright © 2019 ZRY. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    
    @State var showDetail = false
    
    var body: some View {
        
        ZStack {
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach (courseData){ item in
                        CourseView(title: item.title, icon: item.image, color: item.color, shadowColor: item.shadowColor)
                            .onTapGesture {
                                self.showDetail.toggle()
                        }
                    }
                }
            }
            ContentView()
                .offset(y: showDetail ? 0 : UIScreen.main.bounds.height)
                .animation(.default)
                .onTapGesture {
                    self.showDetail = false
            }
        }
        
        
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView:View {
    
    var title:String = "this is a SwiftUI course"
    var icon:String = "bolt.fill"
    var color:Color = .orange
    var shadowColor:Color = Color("orangeShadowColor")
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.white)
                .lineLimit(3)

            Spacer()
            Image(systemName: icon)
                .resizable()
                .frame(width: 200)
                .foregroundColor(.white)
        }
        .padding(20)
        .frame(width: 250, height: 360)
        .background(color)
        .cornerRadius(30)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course:Identifiable {
    var id = UUID()
    var title:String
    var image:String
    var color:Color
    var shadowColor:Color
    
}

let courseData = [
    Course(
        title: "Make an app with SwiftUI",
        image: "flame",
        color: .orange,
        shadowColor: Color("orangeShadowColor")
    ),
    Course(
        title: "Make an app with Flutter",
        image: "ant",
        color: .blue,
        shadowColor: Color("blueShadowColor")
    ),
    Course(
        title: "Make an app with React Native",
        image: "hare",
        color: Color.purple,
        shadowColor: Color("purpleShadowColor")
    ),
]
