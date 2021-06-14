//
//  totalNutritionViewController.swift
//  NutritionAnalysis
//
//  Created by ahmed talaat on 10/06/2021.
//

import UIKit

class totalNutritionViewController: mainViewController {
    var totalNutrition = totalDailyModel(fromDictionary: [:])
    var calories = 0.0

    @IBOutlet weak var stack: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        // Do any additional setup after loading the view.
    }
    
    func setData(){
        let DailySubModel_Calories = totalDailySubModel(fromDictionary: ["label": "Calories","quantity": calories,"unit":"Kcal"])
        initTotalNutritionView(totalDailySubModel: DailySubModel_Calories)
        initTotalNutritionView(totalDailySubModel: totalNutrition.FAT)
        initTotalNutritionView(totalDailySubModel: totalNutrition.CHOLE)
        initTotalNutritionView(totalDailySubModel: totalNutrition.NA)
        initTotalNutritionView(totalDailySubModel: totalNutrition.FIBTG)
        initTotalNutritionView(totalDailySubModel: totalNutrition.PROCNT)
        initTotalNutritionView(totalDailySubModel: totalNutrition.VITA_RAE)
        initTotalNutritionView(totalDailySubModel: totalNutrition.VITB12)
        initTotalNutritionView(totalDailySubModel: totalNutrition.VITB6A)
        initTotalNutritionView(totalDailySubModel: totalNutrition.VITC)
        initTotalNutritionView(totalDailySubModel: totalNutrition.VITD)
        initTotalNutritionView(totalDailySubModel: totalNutrition.VITK1)
        initTotalNutritionView(totalDailySubModel: totalNutrition.CA)
        initTotalNutritionView(totalDailySubModel: totalNutrition.FE)
        initTotalNutritionView(totalDailySubModel: totalNutrition.K)
    }
    
    func initTotalNutritionView(totalDailySubModel:totalDailySubModel){
        let totalNutrition_View = totalNutritionView()
        totalNutrition_View.setTotalDailySubModel = totalDailySubModel
        totalNutrition_View.heightAnchor.constraint(equalToConstant: 60).isActive = true
        stack.addArrangedSubview(totalNutrition_View)
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
