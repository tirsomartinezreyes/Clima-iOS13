//
//  AppModel.swift
//  Clima
//
//  Created by Tirso Martínez on 08/11/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

class AppModel {
    
    static var shared: AppModel = {
        let instance = AppModel()
        return instance
    }()
    
    private init() { }
    
    var city:String = ""
    var temperature: Double = 0.0
    var response:WeatherData? = nil
    
    var temperatureAsString: String {
        return String(format:"%.1f",temperature)
    }
    
    func setResponse(response:WeatherData){
        self.response = response
    }
    
    func getResponse()->WeatherData? {
        if(response != nil){
            return response
        }else{
         return nil
        }
    }
    
    func setCity(city:String){
        self.city = city
    }
    
    func getCity()->String{
        return city
    }
    
    func setTemperature(_ temperature:Double){
        self.temperature = temperature
    }
    
    func getTemperature()->Double{
        return temperature
    }
    
    func debug(){
        print("\n\n++++++++++++++++++++++++++++")
        print("city:\(city)")
        print("- - - - - - - - - - - - - - - \n")
    }
    
    func getConditionIcon(_ weatherId:Int)->String{
        //Based on https://openweathermap.org/weather-conditions
        var output = ""
        switch weatherId {
            case 200...299: output = "cloud.bolt"
            case 300...399: output = "cloud.drizzle"
            case 500...599: output = "cloud.rain"
            case 600...699: output = "cloud.snow"
            case 700...799: output = "cloud.fog"
            case 800: output = "sun.max"
            case 801...899: output = "cloud.bolt"
            default : output = "cloud"
        }
        return output
    }
    
    func getConditionRemoteIcon(_ weatherIcon:String)->String{
        return "http://openweathermap.org/img/wn/\(weatherIcon)@2x.png"
    }
}

extension AppModel: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any{
        return self
    }
}
