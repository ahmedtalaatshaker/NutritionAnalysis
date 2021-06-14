//
//  UserDefaults.swift
//  NutritionAnalysis
//
//  Created by ahmed talaat on 12/06/2021.
//

import Foundation
class userDefault{
    static var shared = userDefault()
    var Etag = ""
    
    private init(){ }
    
    func setEtag(EtagValue:String){
        Etag = EtagValue
        UserDefaults.standard.setValue(EtagValue, forKey: "Etag")
        UserDefaults.standard.synchronize()
    }
    
    func getEtag(){
        Etag = UserDefaults.standard.string(forKey: "Etag") ?? ""
    }
}

enum AppConstants:String {
    case appId = "47379841"
    case appKey = "d28718060b8adfd39783ead254df7f92"
}
