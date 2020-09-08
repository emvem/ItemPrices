//
//  ItemListTableViewController.swift
//  TestTasks
//
//  Created by Admin on 9/8/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ItemListTableViewController: UITableViewController {
    
    private var originalItems: [ItemViewModel] = []
    private var items: [ItemViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    private var repossitory: ItemListRepository
    var routeToItemDetails: ((ItemViewModel) -> Void)?
    
    init(repossitory: ItemListRepository) {
        self.repossitory = repossitory
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupNavigationSearchBar()
        setupSortButton()

        getData()
    }
    
    private func setupViews() {
        
        navigationItem.title = "Items"

        tableView.register(ItemListTableViewCell.self, forCellReuseIdentifier: ItemListTableViewCell.reuseIdentifier)
    }
    
    private func setupNavigationSearchBar() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupSortButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortBarButtonItemPressed))
    }
    
    @objc private func sortBarButtonItemPressed() {
        let alertController = UIAlertController(title: "Sort", message: "Select sort option", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "From Low to High", style: .default, handler: { [unowned self] (action) in
            self.items = self.items.sorted { $0 < $1 }
        }))
        alertController.addAction(UIAlertAction(title: "From High to Low", style: .default, handler: { [unowned self] (action) in
            self.items = self.items.sorted { $0 > $1 }
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    private func getData() {
        repossitory.getItemListViewModels { (result) in
            switch result {
            case .success(let items):
                self.items = items
                self.originalItems = items
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

extension ItemListTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemListTableViewCell.reuseIdentifier, for: indexPath) as! ItemListTableViewCell
        cell.configureCell(with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        routeToItemDetails?(item)
    }
    
}

extension ItemListTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let whitespaceCharacterSet = CharacterSet.whitespaces
        let strippedString =
            searchController.searchBar.text!.trimmingCharacters(in: whitespaceCharacterSet)
        
        let filteredItems = items.filter { ($0.name.contains(strippedString)) || ($0.price.contains(strippedString)) }
        
        items = (filteredItems.count > 0) ? filteredItems : originalItems
        
    }
        
}
