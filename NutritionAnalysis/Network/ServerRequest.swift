//
//  UserServices.swift
//  NutritionAnalysis
//
//  Created by ahmed talaat on 09/06/2021.
//


import Foundation
import Alamofire


class UserServices: PObject {
    
    @objc static let shared = UserServices()
    
    func serverRequests(url :String,
                        method :Alamofire.HTTPMethod = .get,
                        parameters:[String:Any] = [:],
                        success:@escaping ([String:Any]) -> Void,
                        failure:@escaping ([String:Any]) -> Void ) {
        
        let RequestURL = URL(string: url.replacingOccurrences(of: " ", with: "%20"))

        var request = URLRequest(url: RequestURL!)
        request.httpMethod = method.rawValue
        
        if parameters.count > 0{
            let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = httpBody
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        if userDefault.shared.Etag != "" {
            request.addValue(userDefault.shared.Etag, forHTTPHeaderField: "ETag")

        }

        Alamofire.AF.request(request).responseData{ response in

            let resHeaders = (response.metrics?.transactionMetrics[0].response as! HTTPURLResponse).allHeaderFields
            userDefault.shared.setEtag(EtagValue: resHeaders["Etag"] as? String ?? "")
            
            if response.response?.statusCode == 200 || response.response?.statusCode == 201{
                do {
                    let readableJson = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments)
                    if let respoDict = readableJson as? [String:Any] {
                        success(respoDict)
                    }
                }catch {
                    failure(["msg":"Time Out"])
                }
            }else{
                do {
                    let readableJson = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments)
                    if let respoDict = readableJson as? [String:Any] {
                        print("❌")
                        failure(respoDict)
                    }
                }catch {
                    failure(["msg":"Please Check your internet connection!"])
                }
            }
        }
    }
    
    
}
