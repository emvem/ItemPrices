//
//  Router.swift
//  TestTasks
//
//  Created by Admin on 9/8/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class Router {
    
    var navigationController = UINavigationController()
    
    func start() {
        let repository = DummyItemListRepository()
        let viewController = ItemListTableViewController(repossitory: repository)
        viewController.routeToItemDetails = toItemDetails
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func toItemDetails(item: ItemViewModel) {
        let viewController = ItemDetailsViewController(item: item)
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
