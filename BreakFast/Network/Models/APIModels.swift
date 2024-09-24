//
//  APIModels.swift
//  BreakFast
//
//  Created by Kostya Lee on 24/09/24.
//

import Foundation

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

public struct AbridgedFoodNutrient: Decodable {
    public init(number: String? = nil, name: String? = nil, amount: Float? = nil, unitName: String? = nil, derivationCode: String? = nil, derivationDescription: String? = nil) {
        self.number = number
        self.name = name
        self.amount = amount
        self.unitName = unitName
        self.derivationCode = derivationCode
        self.derivationDescription = derivationDescription
    }
    
    let number: String?
    let name: String?
    let amount: Float?
    let unitName: String?
    let derivationCode: String?
    let derivationDescription: String?
}

// Temporary, for UI
public struct Nutrition {
    let name: String
    let value: String
}
