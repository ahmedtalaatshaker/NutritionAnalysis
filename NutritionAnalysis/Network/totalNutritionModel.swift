//
//  totalNutritionModel.swift
//  NutritionAnalysis
//
//  Created by ahmed talaat on 10/06/2021.
//

import Foundation
class totalNutritionModel: NSObject{
    var calories :Double!
    var healthLabels :[String]!
    var uri :String!
    var yield :Int!
    var totalDaily :totalDailyModel!
    var totalWeight :Int!
    
    init(fromDictionary dictionary: [String:Any]){
        calories = dictionary["calories"] as? Double
        healthLabels = dictionary["healthLabels"] as? [String]
        uri = dictionary["uri"] as? String
        yield = dictionary["yield"] as? Int
        totalDaily = dictionary["totalDaily"] as? totalDailyModel
        totalWeight = dictionary["totalWeight"] as? Int
    }
}
