//
//  WeatherRequester.swift
//  Clima
//
//  Created by Tirso Martínez on 10/11/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherRequester {
    let url = "https://api.openweathermap.org/data/2.5/weather?appid=fa5daba8f95443a0c3ded6743265257b&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(url)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //1.- createURL
        if let url = URL(string: urlString){
            
            //2.- create URL session
            let session = URLSession(configuration: .default)
            
            //3.- give the session a task (with trailing clousure)
            
            //Giving function name as handler
            //let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))
            
            //with trailing clousure format as handler
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            //4.- Start the task
            task.resume()
        }
        
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?){
        if error != nil{
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataAsString = String(data: safeData, encoding: .utf8)
            print(dataAsString!)
        }
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try  decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData)
        } catch {
            print(error)
        }
    }
    
}
