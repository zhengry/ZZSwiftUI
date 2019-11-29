//
//  UpdateStore.swift
//  ZZSwiftUI
//
//  Created by zry on 2019/11/29.
//  Copyright © 2019 ZRY. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates = [UpdateItem]()
    
    init(updates:[UpdateItem] = []) {
        self.updates = updates
    }
}

