//
//  NutritionAnalysisTests.swift
//  NutritionAnalysisTests
//
//  Created by ahmed talaat on 09/06/2021.
//

import XCTest
@testable import NutritionAnalysis

class NutritionAnalysisTests: XCTestCase {

    var validTitle = "Fresh Ham Roasted With Rye Bread and Dried Fruit Stuffing"
    var validIgnr = "1 fresh ham, about 18 pounds, prepared by your butcher (See Step 1)\n7 cloves garlic, minced\n1 tablespoon caraway seeds, crushed\n4 teaspoons salt\nFreshly ground pepper to taste\n1 teaspoon olive oil\n1 medium onion, peeled and chopped\n3 cups sourdough rye bread, cut into 1/2-inch cubes\n1 1/4 cups coarsely chopped pitted prunes\n1 1/4 cups coarsely chopped dried apricots\n1 large tart apple, peeled, cored and cut into 1/2-inch cubes\n2 teaspoons chopped fresh rosemary\n1 egg, lightly beaten\n1 cup chicken broth, homemade or low-sodium canned"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }

    override func setUp() {
        super.setUp()
        continueAfterFailure = true
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // MARK: - passed
        checkInitialUI()
        checkSubmitButtonWithDefaultValues(title: "title", ingr: "ignr")
        check2ButtonBarEnabled(title: validTitle, ingr: validIgnr)
        
        
        
        // MARK: - Failed
        
//        checkSubmitButtonWithDefaultValues(title: "", ingr: "")
//        checkSubmitButtonWithDefaultValues(title: "title", ingr: "")
//        checkSubmitButtonWithDefaultValues(title: "", ingr: "ignr")
        
//        check2ButtonBarEnabled(title: "", ingr: validIgnr)
//        check2ButtonBarEnabled(title: validTitle, ingr: "")
//        check2ButtonBarEnabled(title: validTitle + "test", ingr: validIgnr)
//        check2ButtonBarEnabled(title: validTitle, ingr: validIgnr + "test")

    }
    
    let target = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IngredientController") as! IngredientController

    func checkInitialUI(){
        let _ = target.view
        XCTAssertTrue(target.receptTitle.text.isEmpty && target.IngredientView.text.isEmpty,"Recipe Name or ingr or both are not empty!")
    }
    
    func checkSubmitButtonWithDefaultValues(title:String,ingr:String){
        let _ = target.view
        target.receptTitle.text = title
        target.IngredientView.text = ingr
        target.bindToViewModel()
        XCTAssertTrue(target.submitButton.isEnabled,"Title or Ingr or both are Empty!")
    }
    
    func check2ButtonBarEnabled(title:String,ingr:String){
        checkSubmitButtonWithDefaultValues(title: title, ingr: ingr)
        if !target.submitButton.isEnabled{
            XCTFail("Submit Button not Enabled!")
        }
        
        let expectation = self.expectation(description: "Call Finished")
        
        target.ingredientViewModel.makeRequest().subscribe { (respo) in
            XCTAssertTrue(self.target.ingredientSummary.isEnabled, "Ingredient Summary button enabled!")
            expectation.fulfill()
        }onError: { (error) in
            XCTAssertTrue(self.target.ingredientSummary.isEnabled, "Error Occured!\nIngredient Summary button not Enabled!")
            expectation.fulfill()
        }.disposed(by: target.disposeBag)
        
        self.waitForExpectations(timeout: 10) { (error) in
            print(error)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
