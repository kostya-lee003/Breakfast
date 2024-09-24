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
    
    /// Debouncing ensures that a function is only executed once, after a certain delay, and only if a specific event (like typing) has stopped occurring during that delay
    private var timer: Timer?
    
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
                },
                onFailure: { error in
                    print("Failed with error: \(error)")
                }
            )
            .disposed(by: disposeBag)
    }
    
    public func subscribeOnEvents() {
        searchTextRelay
            .subscribe(onNext: { [weak self] text in
                self?.timer?.invalidate()
                /// Create a new timer to delay the search request
                self?.timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { [weak self] _ in
                    guard let self else { return }
                    self.handleTextChange(text)
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func handleTextChange(_ text: String) {
        if text.isEmpty {
            self.items.onNext(originItems)
            return
        }
        
        guard let url = constructor.search(text) else {
            print("URL is nil")
            return
        }
        
        networkService.request(url: url, type: SearchResult.self)
            .subscribe(
                onSuccess: { [weak self] result in
                    self?.items.onNext(result.foods.map(to: AbridgedFoodItem.self) ?? [])
                },
                onFailure: { error in
                    print("Failed with error: \(error)")
                }
            )
            .disposed(by: disposeBag)
    }
}
