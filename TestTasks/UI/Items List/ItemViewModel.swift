//
//  ItemViewModel.swift
//  TestTasks
//
//  Created by Admin on 9/8/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

struct ItemViewModel: Comparable {
    static func == (lhs: ItemViewModel, rhs: ItemViewModel) -> Bool {
        return lhs.item.price == rhs.item.price
    }
    
    static func < (lhs: ItemViewModel, rhs: ItemViewModel) -> Bool {
        return (lhs.item.price ?? 0.0) < (rhs.item.price ?? 0.0)
    }
    
    
    let item: Item
    
    var name: String {
        item.name
    }
    
    var price: String {
        "$\(item.price ?? 0.0)"
    }
    
    var isPriceExist: Bool {
        item.price != nil
    }
    
    init(item: Item) {
        self.item = item
    }
    
}
