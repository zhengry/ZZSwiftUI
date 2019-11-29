//
//  BlurView.swift
//  ZZSwiftUI
//
//  Created by zry on 2019/11/29.
//  Copyright © 2019 ZRY. All rights reserved.
//

import SwiftUI

//struct BlurView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct BlurView_Previews: PreviewProvider {
//    static var previews: some View {
//        BlurView()
//    }
//}
struct BlurView:UIViewRepresentable {
    let style:UIBlurEffect.Style
    
    func makeUIView(context:UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView:UIView,context:UIViewRepresentableContext<BlurView>) {
        
    }
}
