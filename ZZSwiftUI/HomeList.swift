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
        ZStack(alignment: .topLeading) {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Courses")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("22 courses")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                    .padding(.leading, 70.0)
                    .padding(.bottom, 40.0)
                
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing: 40) {
                        ForEach (courseData){ item in
                            Button(action: {
                                self.showDetail.toggle()
                            }) {
                                CourseView(
                                    title: item.title,
                                    icon: item.image,
                                    color: item.color,
                                    shadowColor: item.shadowColor
                                )
                            }
                        }
                    }
                    .padding(.horizontal,40)
                }
                Spacer()
                
            }
                .padding(.top,80)
            
            ContentView()
                .cornerRadius(30)
                .shadow(radius: 20)
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
                .padding(.trailing,50)
            Spacer()
            Image(systemName: icon)
                .resizable()
                .frame(width: 200)
                .foregroundColor(.white)
                .aspectRatio(contentMode: .fill)
        }
            .padding(30)
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
