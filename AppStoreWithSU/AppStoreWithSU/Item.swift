//
//  Item.swift
//  AppStoreWithSU
//
//  Created by yongbeomkwak on 5/11/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
