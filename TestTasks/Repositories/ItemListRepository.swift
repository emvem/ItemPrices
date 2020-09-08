//
//  ItemListRepository.swift
//  TestTasks
//
//  Created by Admin on 9/8/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

protocol ItemListRepository {
    func getItemListViewModels(completion: (Result<[ItemViewModel], Error>) -> Void)
}
