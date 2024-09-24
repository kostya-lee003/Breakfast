//
//  ProductDetailsViewModel.swift
//  BreakFast
//
//  Created by Kostya Lee on 24/09/24.
//

import Foundation
import UIKit
import RxSwift
import RxRelay

class ProductDetailsViewModel {
    var product = BehaviorSubject<AbridgedFoodItem>(value: AbridgedFoodItem(dataType: "", description: "", fdcId: 0))
    
    var items = BehaviorSubject<[AbridgedFoodNutrient]>(value: [])
}
