//
//  totalDailyModel.swift
//  NutritionAnalysis
//
//  Created by ahmed talaat on 10/06/2021.
//

import Foundation
class totalDailyModel: NSObject{
    var CA :totalDailySubModel! //Calcium
    var CHOCDF :totalDailySubModel! //Carbs
    var CHOLE :totalDailySubModel! //Cholesterol
    var ENERC_KCAL :totalDailySubModel! //Energy
    var FASAT :totalDailySubModel! //Saturated
    var FAT :totalDailySubModel! //Fat
    var FE :totalDailySubModel! //Iron
    var FIBTG :totalDailySubModel! //Fiber
    var FOLDFE :totalDailySubModel! //Folate equivalent (total)
    var MG :totalDailySubModel! //Magnesium
    var NA :totalDailySubModel! //Sodium
    var PROCNT :totalDailySubModel! //Protein
    var NIA :totalDailySubModel! //Niacin (B3)
    var RIBF :totalDailySubModel! //Riboflavin (B2)
    var THIA :totalDailySubModel! //Thiamin (B1)
    var TOCPHA :totalDailySubModel! //Vitamin E"
    var K :totalDailySubModel! //Potassium
    var VITA_RAE :totalDailySubModel! //Vitamin A
    var P :totalDailySubModel! //Phosphorus
    var VITB12 :totalDailySubModel! //Vitamin B12
    var VITB6A :totalDailySubModel! //Vitamin B6
    var VITC :totalDailySubModel! //Vitamin C
    var VITD :totalDailySubModel! //Vitamin D
    var VITK1 :totalDailySubModel! //Vitamin K
    var ZN :totalDailySubModel! //Zinc

    init(fromDictionary dictionary: [String:Any]){
        CA = dictionary["CA"] as? totalDailySubModel
        CHOCDF = dictionary["CHOCDF"] as? totalDailySubModel
        CHOLE = dictionary["CHOLE"] as? totalDailySubModel
        ENERC_KCAL = dictionary["ENERC_KCAL"] as? totalDailySubModel
        FASAT = dictionary["FASAT"] as? totalDailySubModel
        FAT = dictionary["FAT"] as? totalDailySubModel
        FE = dictionary["FE"] as? totalDailySubModel
        FIBTG = dictionary["FIBTG"] as? totalDailySubModel
        FOLDFE = dictionary["FOLDFE"] as? totalDailySubModel
        MG = dictionary["MG"] as? totalDailySubModel
        NA = dictionary["NA"] as? totalDailySubModel
        PROCNT = dictionary["PROCNT"] as? totalDailySubModel
        NIA = dictionary["NIA"] as? totalDailySubModel
        RIBF = dictionary["RIBF"] as? totalDailySubModel
        THIA = dictionary["THIA"] as? totalDailySubModel
        TOCPHA = dictionary["TOCPHA"] as? totalDailySubModel
        K = dictionary["K"] as? totalDailySubModel
        VITA_RAE = dictionary["VITA_RAE"] as? totalDailySubModel
        P = dictionary["P"] as? totalDailySubModel
        VITB12 = dictionary["VITB12"] as? totalDailySubModel
        VITB6A = dictionary["VITB6A"] as? totalDailySubModel
        VITC = dictionary["VITC"] as? totalDailySubModel
        VITD = dictionary["VITD"] as? totalDailySubModel
        VITK1 = dictionary["VITK1"] as? totalDailySubModel
        ZN = dictionary["ZN"] as? totalDailySubModel
    }
    
}

