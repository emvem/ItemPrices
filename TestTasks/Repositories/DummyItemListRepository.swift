//
//  DummyItemListRepository.swift
//  TestTasks
//
//  Created by Admin on 9/8/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

class DummyItemListRepository: ItemListRepository {
    
    func getItemListViewModels(completion: (Result<[ItemViewModel], Error>) -> Void) {
        let items: [Item] = [
                Item(name: "Item 1", price: 100),
                Item(name: "Item 2", price: 200),
                Item(name: "Item 3", price: 90),
                Item(name: "Item 4", price: nil),
                Item(name: "Item 5", price: nil),
                Item(name: "Item 6", price: 300),
                Item(name: "Item 7", price: 100)
            ]

        completion(.success(items.map { ItemViewModel(item: $0) } ))
    }
    
}
