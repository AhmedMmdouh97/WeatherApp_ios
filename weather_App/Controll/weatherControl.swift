//
//  weatherControl.swift
//  weather_App
//
//  Created by Ahmed Mamdouh on 17/06/2022.
//

import Foundation
protocol weatherManagerDelegate {
    func didupdataweather(weather : item)
}
struct Api{
    var delegate : weatherManagerDelegate?
    let Url = "https://api.openweathermap.org/data/2.5/weather?appid=b4730d65165ce6b6380b1e724f0640cd"
    
    
     func FuatchData(cityName : String) {
        let UrlCity = "\(Url)&q=\(cityName)"
        self.preformreq(urlString: UrlCity)
    }
     func preformreq(urlString : String){
        if let url = URL(string: urlString) {
            
            let sessen = URLSession(configuration: .default)
            let task = sessen.dataTask(with: url) { data, response, erro in
                if erro != nil {
                    print(erro!)
                    return
                }
                if let safaData = data{
                    if let weather = self.json(weatherData: safaData){
                        delegate?.didupdataweather(weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
     func json(weatherData: Data) -> item? {
        let decder = JSONDecoder()
        do{
            let decoderData = try decder.decode(Dataa.self, from: weatherData)
            let name = decoderData.name
            let temp = decoderData.main.temp
            let id = decoderData.weather[0].id
            let tempma = decoderData.main.temp_max
            let tempmi = decoderData.main.temp_min
            let weather = item(condinationId: id, cityName: name, tempratare: temp, tempmax: tempma, tempmin: tempmi)
                
            return weather
        }catch{
            print("erro")
            return nil
        }
    }
}
