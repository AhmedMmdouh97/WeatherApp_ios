//
//  finalItem.swift
//  weather_App
//
//  Created by Ahmed Mamdouh on 19/06/2022.
//

import Foundation
struct item {
    let condinationId : Int
    let cityName : String
    let tempratare : Double
    let tempmax : Double
    let tempmin : Double
    
    var tempratar: String {
        return String(format: "%.1f", tempratare)
    }
    
    var tempma:String {
        return String(format: "%.1f", tempmax)
    }

    var tempmi:String {
        return String(format: "%.1f", tempmin)
    }
    
    var condition : String {
        switch condinationId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "sun.max"
        }
    }
}
