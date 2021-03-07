//
//  StocksListTableViewController.swift
//  StocksApp
//
//  Created by Светлана Романенко on 06.03.2021.
//

import UIKit

class StocksListTableViewController: UITableViewController {
    
    //MARK: - Private properties
    
    private var companies: [Company] = []
    private var company: Company?
    private var urls: URLs.AllCases?
    private var filteredStocks: [Company] = []
    private var searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupSearchController()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredStocks.count : companies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "showStock", for: indexPath) as! TableViewCell
        
        let result = isFiltering ? filteredStocks[indexPath.row] : companies[indexPath.row]
        cell.displayStockInfo(company: result)
        
        let url = urls?[indexPath.row].rawValue
        requestData(from: url ?? "")
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let company = companies[indexPath.row]
        let stockInfoVC = segue.destination as! StocksInfoViewController
        stockInfoVC.company = company
    }
    
// MARK: - Private methods
    
private func setupSearchController() {
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Search"
    searchController.searchBar.barTintColor = .white
    navigationItem.searchController = searchController
    definesPresentationContext = true
    
    if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
        textField.font = UIFont.boldSystemFont(ofSize: 17)
        textField.textColor = .white
        }
    }
    
    private func requestData(from url: String) {
        NetworkManager.shared.requestData(for: url) { company in
            self.company = company
            self.tableView.reloadData()
        }
    }
}

// MARK: - UISearchResultsUpdating

extension StocksListTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredStocks = companies.filter { company in
            company.companyName.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
}
