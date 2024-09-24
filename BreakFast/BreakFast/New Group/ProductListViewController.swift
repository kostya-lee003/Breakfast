//
//  ProductListViewController.swift
//  BreakFast
//
//  Created by Kostya Lee on 23/09/24.
//

import UIKit
import RxSwift

class ProductListViewController: UIViewController {

    private let searchController = UISearchController(searchResultsController: nil)
    private let tableView = UITableView()

    private let viewModel = ProductListViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindVM()
        viewModel.fetchProducts()
        viewModel.subscribeOnEvents()
    }
    
    private func setupViews() {
        self.view.backgroundColor = UIColor.Common.background
        self.title = "Breakfast"
        
        searchController.searchBar.sizeToFit()
        searchController.searchBar.placeholder = "Search a product"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.searchTextField.backgroundColor = UIColor.Common.foreground
        navigationItem.searchController = searchController
        
        tableView.frame = view.bounds
        tableView.register(ProductListCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = 70
        self.view.addSubview(tableView)
    }
    
    private func layout() {}
    
    private func bindVM() {
        // Table View
        viewModel.items
            .bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: ProductListCell.self)) { index, model, cell in
                cell.update(model)
            }
            .disposed(by: disposeBag)

        tableView.rx
            .modelSelected(AbridgedFoodItem.self)
            .subscribe(onNext: { [weak self] value in
                guard let self else { return }
                let vc = ProductDetailsViewController(product: value)
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)
        
        // Search
        searchController.searchBar.searchTextField.rx.text
            .orEmpty
            .bind(to: viewModel.searchTextRelay)
            .disposed(by: disposeBag)
    }
}
