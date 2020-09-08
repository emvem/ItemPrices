//
//  ItemDetailsViewController.swift
//  TestTasks
//
//  Created by Admin on 9/8/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController {
 
    var item: ItemViewModel
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = "Имя: " + item.name
        }
    }
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            priceLabel.text = "Цена: " + item.price
        }
    }
    
    init(item: ItemViewModel) {
        self.item = item
        super.init(nibName: "ItemDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Item details"
    }
    
}
