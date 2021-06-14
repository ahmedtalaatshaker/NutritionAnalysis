//
//  totalNutritionView.swift
//  NutritionAnalysis
//
//  Created by ahmed talaat on 10/06/2021.
//

import UIKit

class totalNutritionView: UIView {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var conView: UIView!

    @IBInspectable var setTotalDailySubModel: totalDailySubModel? {
        didSet {
            title.text = setTotalDailySubModel!.label + ":"
            value.text = "\(String(format: "%0.2f", setTotalDailySubModel!.quantity ?? 0.0)) \(setTotalDailySubModel!.unit!)"
        }
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
        
        guard let view = Bundle(for: type(of: self)).loadNibNamed("totalNutritionView", owner: self, options: nil)?.first as? UIView else {
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
