//
//  DayModel.swift
//  WeatherApp
//
//  Created by Daniel Leah on 25/02/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//
//40ead433db85d746bf204d9f86920d52
import Foundation

struct DayModel: Decodable {
    struct Main: Decodable {
        let temp: Double
        let pressure: Double
        let humidity: Double
    }
    
    struct Weather: Decodable {
        let main: String
        let description: String
    }
    
    struct Wind: Decodable {
        let speed: Double
    }
    
    let main: Main
    let wind: Wind
    let weather: [Weather]
    let dt_txt: String
}

struct City: Decodable {
    let name: String
    let country: String
}

struct DataAPI: Decodable {
    let cod: String
    let list: [DayModel]
    let city: City
}
