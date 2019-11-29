//
//  UpdateDetail.swift
//  ZZSwiftUI
//
//  Created by zry on 2019/11/29.
//  Copyright © 2019 ZRY. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    
    var title:String = ""
    var image:String = ""
    var content:String = ""
    var color:Color = .white

    var body: some View {
        VStack(alignment: .center, spacing: 20){
            Text(title)
                .font(.largeTitle)
            Image(systemName:image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:300)
                .foregroundColor(color)
            Text(content)
                .frame(alignment:.leading)
            Spacer()
        }
            .padding(.horizontal,20)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
