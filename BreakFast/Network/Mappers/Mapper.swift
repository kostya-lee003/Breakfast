//
//  Mapper.swift
//  BreakFast
//
//  Created by Kostya Lee on 24/09/24.
//

import Foundation

extension Collection {
    func map<T>(to type: T.Type) -> [T]? {
        if Self.Element.self is SearchResultFood && type == AbridgedFoodItem.self {
            return self.compactMap { element in
                if let food = element as? SearchResultFood {
                    // Perform the actual conversion logic
                    let mappedFood = AbridgedFoodItem(
                        dataType: food.dataType,
                        description: food.description,
                        fdcId: food.fdcId,
                        foodNutrients: food.foodNutrients,  // Map food nutrients if necessary
                        publicationDate: food.publicationDate,
                        brandOwner: food.brandOwner,
                        gtinUpc: food.gtinUpc,
                        ndbNumber: food.ndbNumber,
                        foodCode: food.foodCode
                    )
                    return mappedFood as? T
                }
                return nil
            }
        }
        return nil
    }
}
