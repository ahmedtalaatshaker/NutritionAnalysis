//
//  ingredientSummaryViewController.swift
//  NutritionAnalysis
//
//  Created by ahmed talaat on 10/06/2021.
//

import UIKit

class ingredientSummaryViewController: mainViewController {
    var totalNutrition = totalNutritionModel(fromDictionary: [:])
    @IBOutlet weak var totalButton: UIButton!
    @IBOutlet weak var stack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalButton.layer.cornerRadius = 5
        setData()
        // Do any additional setup after loading the view.
    }
    
    func setData(){
        for ingredient in totalNutrition.ingredients{
            for parsed in ingredient.parsed{
                initIngredientSummaryView(parsed: parsed)
            }
        }
    }

    func initIngredientSummaryView(parsed:Parsed){
        let ingredientSummary_View = ingredientSummaryView()
        ingredientSummary_View.setIngredient = parsed
        ingredientSummary_View.delegate = self
        stack.addArrangedSubview(ingredientSummary_View)
    }
    
    @IBAction func totalNutrition(_ sender: Any) {
        let target = UIStoryboard(name: "totalNutrition", bundle: nil).instantiateInitialViewController() as! totalNutritionViewController

        target.totalNutrition = totalNutrition.totalNutrients
        target.calories = totalNutrition.calories
        target.title = "Total Nutrition"
        navigationController?.pushViewController(target, animated: true)
    }

}

extension ingredientSummaryViewController :ingredientTapped{
    func didTapIngredientView(_ ingredientSummaryView: ingredientSummaryView) {
        print("ingredient tapped")
    }
}
