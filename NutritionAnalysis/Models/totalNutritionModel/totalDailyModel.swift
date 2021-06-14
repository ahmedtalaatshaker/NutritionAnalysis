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
    var TOCPHA :totalDailySubModel! //Vitamin E
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
        if let Data = dictionary["CA"] as? [String:Any]{
            CA = totalDailySubModel(fromDictionary: Data)
            CA.unit = "mg"
        }
        
        if let Data = dictionary["CHOCDF"] as? [String:Any]{
            CHOCDF = totalDailySubModel(fromDictionary: Data)
            CHOCDF.unit = "mg"
        }
        
        if let Data = dictionary["CHOLE"] as? [String:Any]{
            CHOLE = totalDailySubModel(fromDictionary: Data)
            CHOLE.unit = "mg"
        }
        
        if let Data = dictionary["ENERC_KCAL"] as? [String:Any]{
            ENERC_KCAL = totalDailySubModel(fromDictionary: Data)
            ENERC_KCAL.unit = "Kcal"
        }
        
        if let Data = dictionary["FASAT"] as? [String:Any]{
            FASAT = totalDailySubModel(fromDictionary: Data)
            FASAT.unit = "g"
        }
        
        if let Data = dictionary["FAT"] as? [String:Any]{
            FAT = totalDailySubModel(fromDictionary: Data)
            FAT.unit = "g"
        }
        
        if let Data = dictionary["FE"] as? [String:Any]{
            FE = totalDailySubModel(fromDictionary: Data)
            FE.unit = "mg"
        }
        
        if let Data = dictionary["FIBTG"] as? [String:Any]{
            FIBTG = totalDailySubModel(fromDictionary: Data)
            FIBTG.unit = "g"
        }
        
        if let Data = dictionary["FOLDFE"] as? [String:Any]{
            FOLDFE = totalDailySubModel(fromDictionary: Data)
            FOLDFE.unit = "æg"

        }
        
        if let Data = dictionary["MG"] as? [String:Any]{
            MG = totalDailySubModel(fromDictionary: Data)
            MG.unit = "mg"
        }
        
        if let Data = dictionary["NA"] as? [String:Any]{
            NA = totalDailySubModel(fromDictionary: Data)
            NA.unit = "mg"
        }
        
        if let Data = dictionary["PROCNT"] as? [String:Any]{
            PROCNT = totalDailySubModel(fromDictionary: Data)
            PROCNT.unit = "g"
        }
        
        if let Data = dictionary["NIA"] as? [String:Any]{
            NIA = totalDailySubModel(fromDictionary: Data)
            NIA.unit = "mg"
        }
        
        if let Data = dictionary["RIBF"] as? [String:Any]{
            RIBF = totalDailySubModel(fromDictionary: Data)
            RIBF.unit = "mg"
        }
        
        if let Data = dictionary["THIA"] as? [String:Any]{
            THIA = totalDailySubModel(fromDictionary: Data)
            THIA.unit = "mg"
        }
        
        if let Data = dictionary["TOCPHA"] as? [String:Any]{
            TOCPHA = totalDailySubModel(fromDictionary: Data)
            TOCPHA.unit = "mg"
        }
        
        if let Data = dictionary["K"] as? [String:Any]{
            K = totalDailySubModel(fromDictionary: Data)
            K.unit = "mg"
        }
        
        if let Data = dictionary["VITA_RAE"] as? [String:Any]{
            VITA_RAE = totalDailySubModel(fromDictionary: Data)
            VITA_RAE.unit = "æg"

        }
        
        if let Data = dictionary["P"] as? [String:Any]{
            P = totalDailySubModel(fromDictionary: Data)
            P.unit = "mg"

        }
        
        if let Data = dictionary["VITB12"] as? [String:Any]{
            VITB12 = totalDailySubModel(fromDictionary: Data)
            VITB12.unit = "mg"
        }
        
        if let Data = dictionary["VITB6A"] as? [String:Any]{
            VITB6A = totalDailySubModel(fromDictionary: Data)
            VITB6A.unit = "mg"
        }
        
        if let Data = dictionary["VITC"] as? [String:Any]{
            VITC = totalDailySubModel(fromDictionary: Data)
            VITC.unit = "mg"
        }
        
        if let Data = dictionary["VITD"] as? [String:Any]{
            VITD = totalDailySubModel(fromDictionary: Data)
            VITD.unit = "mg"
        }
        
        if let Data = dictionary["VITK1"] as? [String:Any]{
            VITK1 = totalDailySubModel(fromDictionary: Data)
            VITK1.unit = "mg"
        }
        
        if let Data = dictionary["ZN"] as? [String:Any]{
            ZN = totalDailySubModel(fromDictionary: Data)
            ZN.unit = "mg"
        }
        
    }
    
}

