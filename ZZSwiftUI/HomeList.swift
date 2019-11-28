//
//  HomeList.swift
//  ZZSwiftUI
//
//  Created by zry on 2019/11/28.
//  Copyright © 2019 ZRY. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                ForEach (0..<4){ item in
                    CourseView()
                    
                }
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
    var body: some View {
        VStack(alignment: .leading) {
            Text("this is a SwiftUI course")
                .font(.largeTitle)
                .foregroundColor(.white)
                .lineLimit(3)
                .padding(20)
                .frame(width: 150)

            Spacer()
            Image(systemName: "bolt.fill")
                .resizable()
                .frame(width: 240)
                .foregroundColor(.orange)
        }
        .frame(width: 250, height: 360)
        .background(Color.blue)
        .cornerRadius(30)
        .shadow(color: Color("blueShadowColor"), radius: 20, x: 0, y: 20)
    }
}
