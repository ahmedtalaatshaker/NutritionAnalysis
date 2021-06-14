//
//  parsed.swift
//  NutritionAnalysis
//
//  Created by ahmed talaat on 10/06/2021.
//

import Foundation


class Parsed : NSObject{

    var food : String!
    var foodId : String!
    var foodMatch : String!
    var measure : String!
    var measureURI : String!
    var nutrients : totalDailyModel!
    var quantity : Double!
    var retainedWeight : Int!
    var status : String!
    var weight : Double!

    
    init(fromDictionary dictionary: [String:Any]){
        food = dictionary["food"] as? String
        foodId = dictionary["foodId"] as? String
        foodMatch = dictionary["foodMatch"] as? String
        measure = dictionary["measure"] as? String
        measureURI = dictionary["measureURI"] as? String
        if let nutrientsData = dictionary["nutrients"] as? [String:Any]{
            nutrients = totalDailyModel(fromDictionary: nutrientsData)
        }
        quantity = dictionary["quantity"] as? Double
        retainedWeight = dictionary["retainedWeight"] as? Int
        status = dictionary["status"] as? String
        weight = dictionary["weight"] as? Double
    }


}
