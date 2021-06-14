//
//  ingredientSummaryView.swift
//  NutritionAnalysis
//
//  Created by ahmed talaat on 10/06/2021.
//

import UIKit

protocol ingredientTapped {
    func didTapIngredientView(_ ingredientSummaryView:ingredientSummaryView)
}
class ingredientSummaryView: UIView {
    @IBOutlet weak var Food: UILabel!
    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var unit: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var conView: UIView!
    
    var delegate : ingredientTapped!
    
    @IBInspectable var setIngredient: Parsed? {
        didSet {
            Food.text = setIngredient?.food
            qty.text = "\(setIngredient!.quantity ?? 0)"
            unit.text = setIngredient?.measure
            weight.text = "\(String(format: "%0.2f", setIngredient!.weight ?? 0.0))"
            calories.text = "\(String(format: "%0.2f", setIngredient!.nutrients.ENERC_KCAL.quantity ?? 0.0))"
        }
    }
    
    @IBAction func selectIngredient(_ sender: Any) {
        delegate.didTapIngredientView(self)
    }
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)!
        
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    func commonInit() {
        
        guard let view = Bundle(for: type(of: self)).loadNibNamed("ingredientSummaryView", owner: self, options: nil)?.first as? UIView else {
            return
        }
        
        frame = view.bounds
        
        self.addSubview(view)
        
        initUi()
    }
    
    
    fileprivate func initUi() {
        conView.layer.cornerRadius = 10
        conView.layer.masksToBounds = false
        conView.layer.shadowColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        conView.layer.shadowOpacity = 0.5
        conView.layer.shadowRadius = 4
    }

}
