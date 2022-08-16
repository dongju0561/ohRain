//
//  WeatherData.swift
//  oh!Rain
//
//  Created by macbook on 2022/08/13.
//

import Foundation

struct WeatherData : Codable {
    let daily: [Daily]
}

struct Daily: Codable{
    let pop: Double
    let temp: Temp
    let weather: [Weather]
}

struct Temp: Codable {
    let day: Double
}

struct Weather: Codable {
    let main: String
}


//https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=20b98424cb941d426fddca5261130820
