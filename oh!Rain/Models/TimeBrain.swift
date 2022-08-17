//
//  TimeBrain.swift
//  oh!Rain
//
//  Created by macbook on 2022/08/14.
//

import Foundation

struct Time{
    let hour: Int
    let min: Int
    
    static func ChangeTimeToSting( t : Time) -> String{
        var hourS = ""
        var minS = ""
        if t.hour < 10{
            hourS = "0\(t.hour)"
        }
        else{
            hourS = "\(t.hour)"
        }
        if t.min < 10{
            minS = "0\(t.min)"
        }
        else{
            minS = "\(t.min)"
        }
        return "\(hourS):\(minS)"
    }
}
