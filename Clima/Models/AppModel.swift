//
//  AppModel.swift
//  Clima
//
//  Created by Tirso Martínez on 08/11/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct AppModel{
    var city:String = ""
    
    mutating func setCity(city:String){
        self.city = city
    }
    
    func getCity()->String{
        return city
    }
    
    func debug(){
        print("\n\n++++++++++++++++++++++++++++")
        print("city:\(city)")
        print("- - - - - - - - - - - - - - - \n")
    }
}
