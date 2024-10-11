//
//  File.swift
//  
//
//  Created by SeanHuang on 7/27/24.
//

import Foundation

//Viewmodel that is responsible for publishing models to populate its view
//assume that there will be a small amount of desert
//DessertViewModel will not load all assets for all DetailDesertModel at the begining.
public class DessertAsyncViewModel : DessertViewModel{
    @Published public var ms  : [MealModel] = []
    public var apiService : DessertAPIAsyncSerivice
    //load all the desert Name only
    public init(apiService : DessertAPIAsyncSerivice = DessertAPIAsyncSerivice()) {
        apiService.initService()
        print("Init DessertVM")
        self.apiService = apiService
        Task(priority: .high){
            if let list = await apiService.reteriveAllDessert(){
                await MainActor.run(body: {
                    print("DessertVM: Reterived all dessert list")
                    self.ms = list.sorted { $0.meal < $1.meal}
                })
            }else{
                print("DessertVM init: Failed to reterive list of All Dessert")
            }
        }
    }
    
 
}

public protocol DessertViewModel: ObservableObject{
    var ms :[MealModel] {get}
}
