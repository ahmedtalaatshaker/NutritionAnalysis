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
    var ingredients : [Ingredient]!
    var totalNutrients : totalDailyModel!

    init(fromDictionary dictionary: [String:Any]){
        print(dictionary)
        calories = dictionary["calories"] as? Double
        healthLabels = dictionary["healthLabels"] as? [String]
        uri = dictionary["uri"] as? String
        yield = dictionary["yield"] as? Int
        if let totalDailyData = dictionary["totalDaily"] as? [String:Any]{
            totalDaily = totalDailyModel(fromDictionary: totalDailyData)
        }
        if let totalNutrientsData = dictionary["totalNutrients"] as? [String:Any]{
            totalNutrients = totalDailyModel(fromDictionary: totalNutrientsData)
        }

        totalWeight = dictionary["totalWeight"] as? Int
        ingredients = [Ingredient]()
        if let ingredientsArray = dictionary["ingredients"] as? [[String:Any]]{
            for dic in ingredientsArray{
                let value = Ingredient(fromDictionary: dic)
                ingredients.append(value)
            }
        }

    }
}
