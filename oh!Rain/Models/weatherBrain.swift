//
//  weatherBrain.swift
//  oh!Rain
//
//  Created by macbook on 2022/08/11.
//

import Foundation

struct WeatherBrain {
    
    static func isItRain( pct : Double) -> String{
        if pct >= 51{
            return "우산을 챙기세요 🌂"
        }
        if pct == 50{
            return "너의 운에 맡길게 🙏"
        }
        else{
            return "양손 가볍게 😀"
        }
    }
}
