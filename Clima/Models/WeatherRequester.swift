//
//  WeatherRequester.swift
//  Clima
//
//  Created by Tirso Martínez on 10/11/21.
//  Copyright © 2021 App Brewery. All rights reserved.



/*
 %%mermaid
graph TD
 fetchWeather[fetchWeather] --> |"Prepare url String for API call to openWeather"| pR[performRequest]
 pR --> |"::Async:: API Response"| h[handle]
 h --> |"API call OK"| parseJSON[parseJSON]
 h --> |"API call Error"| return(return)
 parseJSON --> |Data OK| sR(AppModel.setResponse)
 parseJSON --> |Data error| sR
*/


import Foundation

struct WeatherRequester {
    let url = "https://api.openweathermap.org/data/2.5/weather?appid=fa5daba8f95443a0c3ded6743265257b&units=metric"
    
    //fW
    func fetchWeather(cityName: String){
        let urlString = "\(url)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    //pR
    func performRequest(urlString: String){
        
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?){
     if error != nil{
         print(error!)
         return
     }
     
     if let safeData = data {
         parseJSON(weatherData: safeData)
     }
     else{
         print("JSON parse Error")
     }
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try  decoder.decode(WeatherData.self, from: weatherData)
            AppModel.shared.setResponse(response: decodedData)
        } catch {
            print(error)
            AppModel.shared.setResponse(response: nil)
        }
    }

}
