//
//  totalDailySubModel.swift
//  NutritionAnalysis
//
//  Created by ahmed talaat on 10/06/2021.
//

import Foundation
class totalDailySubModel : NSObject{
    var label :String!
    var quantity :Double!
    var unit :String!
    
    init(fromDictionary dictionary: [String:Any]){
        label = dictionary["label"] as? String
        quantity = dictionary["quantity"] as? Double
        unit = dictionary["unit"] as? String
    }
    
}

