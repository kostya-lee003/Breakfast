//
//  ProductListViewModel.swift
//  BreakFast
//
//  Created by Kostya Lee on 24/09/24.
//

import Foundation
import RxSwift
import RxCocoa

class ProductListViewModel {
    var originItems = [AbridgedFoodItem]()
    var items = PublishSubject<[AbridgedFoodItem]>()
    
    let searchTextRelay: BehaviorRelay<String> = BehaviorRelay(value: "")
    
    private let DEMO_KEY = "DEMO_KEY&query-Cheddar%20Cheese"
    
    private let networkService = NetworkService()
    private let constructor = URLConstructor()
    private let disposeBag = DisposeBag()
    
    public func fetchProducts() {
        guard let url = constructor.foodsList() else {
            print("URL is nil")
            return
        }
        
        networkService.request(url: url, type: [AbridgedFoodItem].self)
            .subscribe(
                onSuccess: { [weak self] result in
                    self?.originItems = result
                    self?.items.onNext(result)
                    self?.items.onCompleted()
                },
                onFailure: { error in
                    print("Failed with error: \(error)")
                }
            )
            .disposed(by: disposeBag)
    }
    
    public func subscribe() {
        searchTextRelay
            .subscribe(onNext: { [weak self] text in
                print("Updated text: \(text)")
                self?.handleSearch(text)
            })
            .disposed(by: disposeBag)
    }
    
    private func handleSearch(_ text: String) {
        
    }
}
