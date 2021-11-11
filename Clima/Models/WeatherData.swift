//
//  WeatherData.swift
//  Clima
//
//  Created by Tirso Martínez on 11/11/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let cod: Int
    let id : Int
    let timezone: Int
    let base: String
    let visibility: Int
    let dt: Int
    let coord: Coordinates
    let main: Main
    let weather: [Weather]
    let wind: Wind
    let clouds: Clouds
    let sys: Sys
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Coordinates: Decodable {
    let lat: Double
    let lon: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int
}

struct Clouds: Decodable {
    let all: Int
}

struct Sys: Decodable {
    let type: Int
    let id : Int
    let country: String
    let sunrise: Int
    let sunset: Int
}
