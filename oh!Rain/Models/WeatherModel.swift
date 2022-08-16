//
//  weatherModel.swift
//  oh!Rain
//
//  Created by macbook on 2022/08/14.
//

import Foundation
import UIKit

struct WeatherModel{
    let pop: Double
    let temp: Double
    let weather: String
    
    var getPct: Double{
        get{
            
            let getPct = pop*100
            return getPct
        }
    }
    
    var tempString: String{
        get{
            
            print(temp)
            let temp = String(format: "%.1f˚C", temp)
            return temp
        }
    }
    var weatherImage: UIImage{
        get{
            switch weather {
            case "clear sky":
                return UIImage(systemName: "sun.max")!
            case "few clouds":
                return UIImage(systemName: "sun.max")!
            case "scattered clouds":
                return UIImage(systemName: "sun.max")!
            case "broken clouds":
                return UIImage(systemName: "sun.max")!
            case "shower rain":
                return UIImage(systemName: "sun.max")!
            case "rain":
                return UIImage(systemName: "sun.max")!
            case "thunderstorm":
                return UIImage(systemName: "sun.max")!
            case "snow":
                return UIImage(systemName: "sun.max")!
            default:
                return UIImage(systemName: "sun.max")!
            }
        }
    }
}
