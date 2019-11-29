//
//  ContentView.swift
//  ZZSwiftUI
//
//  Created by zry on 2019/11/26.
//  Copyright © 2019 ZRY. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        
        ZStack {
            
            BlurView(style: .light)
            
            TitleView()
                .blur(radius: show ? 10.0 : 0)//模糊效果
                .animation(.default)
            BottomView()
                .blur(radius: show ? 10.0 : 0)
                .animation(.default)
            
            
            CardView()
                .background(show ? Color.red : Color.green)
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                //                .rotation3DEffect(Angle(degrees: show ? 50.0 : 0), axis: (x: 10, y: 10, z: 10))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
             
            CardView()
                .background(show ? Color.purple : Color.blue)
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                //                .rotation3DEffect(Angle(degrees: show ? 40.0 : 0), axis: (x: 10, y: 10, z: 10))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            
            CertificateView()
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                //                .rotation3DEffect(Angle(degrees: show ? 30.0 : 0.0), axis: (x: 10, y: 10, z: 10))
                //                .blendMode(.darken)
                .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 0))
                
                //点击事件
                .onTapGesture {
                    self.show.toggle()
                }
                // 拖拽手势
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            self.viewState = value.translation
                            self.show = true//拖拽的同时改变周围视图的模糊程度
                        })
                        .onEnded({ (value) in
                            self.viewState = .zero
                            self.show = false
                        })
                )
        }
//            .background(Color.white)
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    struct CardView:View {
        var body: some View {
            return VStack {
                Text("placeholder")
                Text("card back")
            }
            .frame(width: 340, height: 220)
            
        }
        
    }
    
    struct CertificateView:View {
        var body: some View {
            VStack {
                HStack {
                    VStack(alignment: .leading){
                        Text("UI Design")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("basicColor"))
                            .padding(.top)
                        Text("Certificate")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.orange)
                    
                }
                .padding(.horizontal)
                Spacer()
                Image(systemName: "creditcard")
                    .resizable()
                    .frame(width: 150, height: 110)
                    .foregroundColor(.orange)
                
            }
            .frame(width: 340, height: 220)
            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 20)
        }
    }
}

struct TitleView:View {
    var body: some View {
        return VStack {
            HStack{
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.orange)
                Spacer()
            }
            Image(systemName: "person.3.fill")
                .resizable()
                .frame(width: 100, height: 50)
                .foregroundColor(.orange)
            Spacer()
            
        }.padding()
    }
}

struct BottomView:View {
    var body: some View {
        return VStack(spacing:20) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3.0)
                .opacity(0.1)
            Text("this certificate is proof that Meng to has achieved the UI Design course with approval from a Design+Code instructor.")
                .lineLimit(2)
            Spacer()
        }
            
        .padding()
            .padding(.horizontal)//添加水平方向的内边距
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 20)
            .offset(y: 600)
    }
}
