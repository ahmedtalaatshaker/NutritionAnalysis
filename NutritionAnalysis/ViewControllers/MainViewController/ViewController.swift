//
//  ViewController.swift
//  NutritionAnalysis
//
//  Created by ahmed talaat on 09/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

class IngredientController: mainViewController {

    @IBOutlet weak var receptTitle: UITextView!
    @IBOutlet weak var IngredientView: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var ingredientSummary: UIBarButtonItem!
    @IBOutlet weak var totalNutritionBarButton: UIBarButtonItem!

    var ingredientViewModel : IngredientViewModel!
    var disposeBag = DisposeBag()
    var activityIndicator = UIActivityIndicatorView(style: .large)
    var totalNutrition = totalNutritionModel(fromDictionary: [:])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 5
        receptTitle.layer.cornerRadius = 5
        IngredientView.layer.cornerRadius = 5
        hideKeyboardWhenTappedAround()
        bindToViewModel()
    }
    
    func bindToViewModel(){
        ingredientViewModel = IngredientViewModel()
        ingredientViewModel.isCanMakeRequest()

        IngredientView.rx.text
            .bind(to: ingredientViewModel.ingrediantsText)
            .disposed(by: disposeBag)
        
        receptTitle.rx.text
            .bind(to: ingredientViewModel.receptTitle)
            .disposed(by:disposeBag)
        
        ingredientViewModel.buttonState.asObservable()
            .subscribe { [weak self] (value) in
                self?.setSubmitButton(isEnabled: (value.element ?? false) ?? false)
            }.disposed(by:disposeBag)

        ingredientViewModel.activityIndicatorState.subscribe { (value) in
            if value.element! ?? false{
                self.view.bringSubviewToFront(self.activityIndicator)
                self.activityIndicator.startAnimating()
                self.activityIndicator.center = self.view.center
                self.view.addSubview(self.activityIndicator)
            }else{
                self.activityIndicator.removeFromSuperview()
            }
        }.disposed(by: disposeBag)
        
        ingredientViewModel.IngredientSummaryButtonState.asObservable()
            .subscribe { [weak self] (value) in
                self?.setIngredientSummaryButton(isEnabled: (value.element ?? false) ?? false)
            }.disposed(by: disposeBag)
    }
    
    func setSubmitButton(isEnabled:Bool){
        submitButton.isEnabled = isEnabled
    }
    
    func setIngredientSummaryButton(isEnabled:Bool){
        ingredientSummary.isEnabled = isEnabled
        totalNutritionBarButton.isEnabled = isEnabled
    }
    
    @IBAction func submit(_ sender: Any) {
        ingredientViewModel.makeRequest().subscribe { (respo) in
            self.totalNutrition = respo
            print(self.totalNutrition)
            self.alert(message: "Nutrition Analysis Finished\nnow you can view Total Nutrition and Ingredient Summary", viewController: self)
        } onError: { (error) in
            print(error)
            self.alert(message: error.localizedDescription, viewController: self)
        }.disposed(by:disposeBag)
    }
    
    @IBAction func totalNutrition(_ sender: Any) {
        ingredientViewModel.pushTotalNutritionViewController(VC: self, totalNutritionModel: self.totalNutrition)
    }
    
    @IBAction func IngredientSummary(_ sender: Any) {
        ingredientViewModel.pushIngredientSummaryViewController(VC: self, totalNutritionModel: totalNutrition)
    }
}

