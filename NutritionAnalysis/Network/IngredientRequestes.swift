//
//  IngredientRequestes.swift
//  NutritionAnalysis
//
//  Created by ahmed talaat on 09/06/2021.
//

import Foundation
class IngredientRequests :PObject{
    @objc static let shared = IngredientRequests()

    func analysis(title:String,
                  Ingredients:String,
                  success:@escaping([String:Any]) -> Void,
                  failure:@escaping([String:Any]) -> Void){

        let params = [
            "title": title,
            "ingr":Ingredients.split(separator: "\n")
        ] as [String : Any]
        
        let url = "https://api.edamam.com/api/nutrition-details?app_id=\(AppConstants.appId.rawValue)&app_key=\(AppConstants.appKey.rawValue)"
        print(params)
        UserServices.shared.serverRequests(url: url,method: .post, parameters: params) { (respo) in
            success(respo)
        } failure: { (error) in
            failure(error)
        }

    }
    
}
