//
//  Ingredients.swift
//  NutritionAnalysis
//
//  Created by ahmed talaat on 10/06/2021.
//

import Foundation
class Ingredient : NSObject{

    var parsed : [Parsed]!
    var text : String!

    init(fromDictionary dictionary: [String:Any]){
        parsed = [Parsed]()
        if let parsedArray = dictionary["parsed"] as? [[String:Any]]{
            for dic in parsedArray{
                let value = Parsed(fromDictionary: dic)
                parsed.append(value)
            }
        }
        text = dictionary["text"] as? String
    }
}
