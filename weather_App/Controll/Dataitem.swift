//
//  Data.swift
//  weather_App
//
//  Created by Ahmed Mamdouh on 17/06/2022.
//

import Foundation
struct Dataa : Codable {
    let name : String
    let main : Main
    let weather : [Weather]
}
struct Main : Codable {
    let temp : Double
    let temp_min : Double
    let temp_max : Double
}
struct Weather : Codable {
    let description : String
    let id : Int
}
