//
//  AbridgedFoodItem.swift
//  BreakFast
//
//  Created by Kostya Lee on 24/09/24.
//

import Foundation

// Сокращенный
public struct AbridgedFoodItem: Decodable {
    public init(dataType: String, description: String, fdcId: Int, foodNutrients: [AbridgedFoodNutrient]? = nil, publicationDate: String? = nil, brandOwner: String? = nil, gtinUpc: String? = nil, ndbNumber: String? = nil, foodCode: String? = nil) {
        self.dataType = dataType
        self.description = description
        self.fdcId = fdcId
        self.foodNutrients = foodNutrients
        self.publicationDate = publicationDate
        self.brandOwner = brandOwner
        self.gtinUpc = gtinUpc
        self.ndbNumber = ndbNumber
        self.foodCode = foodCode
    }
    
    let dataType: String
    let description: String
    let fdcId: Int
    let foodNutrients: [AbridgedFoodNutrient]?
    let publicationDate: String?
    let brandOwner: String?
    let gtinUpc: String?
    let ndbNumber: String?
    let foodCode: String?
}
