//
//  IngredientViewModel.swift
//  NutritionAnalysis
//
//  Created by ahmed talaat on 09/06/2021.
//

import Foundation
import RxSwift
import RxCocoa

class IngredientViewModel {
    
    var ingrediantsText = BehaviorRelay<String?>(value: "")
    var receptTitle = BehaviorRelay<String?>(value: "")
    var buttonState = BehaviorRelay<Bool?>(value: false)
    var IngredientSummaryButtonState = BehaviorRelay<Bool?>(value: false)
    var activityIndicatorState = BehaviorRelay<Bool?>(value: false)

    var disposeBag = DisposeBag()
    var ingredients = ""
    var title = ""
        
    func makeRequest() -> Observable<totalNutritionModel>{
        return Observable.create { (observer) -> Disposable in
            self.buttonState.accept(false)
            self.activityIndicatorState.accept(true)
            if self.ingredients == "" || self.title == ""{
                self.activityIndicatorState.accept(false)
                observer.onError(NSError(domain: "", code: -1, userInfo: ["error":"ingredients are empty"]))
                return Disposables.create{ }
            }else{
                IngredientRequests.shared.analysis(title: self.title, Ingredients: self.ingredients) { (respo) in
                    self.IngredientSummaryButtonState.accept(true)
                    self.buttonState.accept(true)
                    self.activityIndicatorState.accept(false)
                    let total = totalNutritionModel(fromDictionary: respo)
                    observer.onNext(total)
                } failure: { (error) in
                    self.buttonState.accept(true)
                    self.activityIndicatorState.accept(false)
                    observer.onError(NSError(domain: "", code: -1, userInfo: error))
                }
            }
            return Disposables.create{ }
        }
    }
    
    
    func isCanMakeRequest() {
        ingrediantsText.subscribe(onNext: { (tex_t) in
            self.ingredients = tex_t ?? ""
            self.getAnalysisValues()
        }).disposed(by: disposeBag)
        
        receptTitle.subscribe(onNext: { (titl_e) in
            self.title = titl_e ?? ""
            self.getAnalysisValues()
        }).disposed(by: disposeBag)
    }
    
    func getAnalysisValues(){
        self.IngredientSummaryButtonState.accept(false)
        if (self.ingredients.trimmingCharacters(in: .whitespacesAndNewlines) != "") && (self.title.trimmingCharacters(in: .whitespacesAndNewlines) != "")  {
            self.buttonState.accept(true)
        }else{
            self.buttonState.accept(false)
        }
    }
    
    func pushTotalNutritionViewController(VC:UIViewController, totalNutritionModel:totalNutritionModel){
        let target = UIStoryboard(name: "totalNutrition", bundle: nil).instantiateInitialViewController() as! totalNutritionViewController
        target.totalNutrition = totalNutritionModel.totalDaily
        target.calories = totalNutritionModel.calories
        VC.navigationController?.pushViewController(target, animated: true)
    }
    
    func pushIngredientSummaryViewController(VC:UIViewController,totalNutritionModel:totalNutritionModel){
        let target = UIStoryboard(name: "ingredientSummaryViewController", bundle: nil).instantiateInitialViewController() as! ingredientSummaryViewController
        target.totalNutrition = totalNutritionModel
        VC.navigationController?.pushViewController(target, animated: true)
    }
    
    
}
