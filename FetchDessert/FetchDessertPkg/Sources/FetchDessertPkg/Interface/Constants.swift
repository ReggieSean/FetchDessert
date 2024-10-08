//
//  File.swift
//  
//
//  Created by SeanHuang on 7/27/24.
//

import Foundation

extension APIManager{
    static func allMealAPI(catagory: String) -> URL?{
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=\(catagory)") else{
           return nil
        }
        return url
    }
    static func mealPrep(mealID : Int) -> URL?{
        guard let url = URL(string:"https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)") else{
            print("URL not formable.")
            return nil
        }
        return url
    }
}
