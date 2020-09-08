//
//  ItemListTableViewCell.swift
//  TestTasks
//
//  Created by Admin on 9/8/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ItemListTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "ItemListTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with model: ItemViewModel) {
        textLabel?.text = model.name
        detailTextLabel?.text = (model.isPriceExist) ? model.price : nil
    }
    
}
