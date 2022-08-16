//
//  CityData.swift
//  oh!Rain
//
//  Created by macbook on 2022/08/10.
//

import Foundation
struct CityBrain{
    
    let city : [City] = [City(kr: "서울", en: "seoul", lat: 37.541,lon: 126.986),
                         City(kr: "부산", en: "busan", lat: 35.1379222,lon: 129.05562775),
                         City(kr: "대구", en: "daegu", lat: 35.871389,lon: 128.601389)
                        ]
}
struct City{
    
    let kr : String
    let en : String
    let lat : Double
    let lon : Double
}
