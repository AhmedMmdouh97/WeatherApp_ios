//
//  ViewController.swift
//  weather_App
//
//  Created by Ahmed Mamdouh on 11/06/2022.
//

import UIKit

class ViewController: UIViewController , weatherManagerDelegate{

    @IBOutlet weak var textEnter: UITextField!
    @IBOutlet weak var imageWeather: UIImageView!
    @IBOutlet weak var labelDay: UILabel!
    @IBOutlet weak var labelDagre: UILabel!
    @IBOutlet weak var imageMax: UIImageView!
    @IBOutlet weak var imageMin: UIImageView!
    @IBOutlet weak var tempMin: UILabel!
    @IBOutlet weak var tempMax: UILabel!
    var ap = Api()
    override func viewDidLoad() {
        super.viewDidLoad()
        ap.delegate = self
        print(Date().dayOfWeek()!)

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonGo(_ sender: UIButton) {
        textEnter.placeholder = ""
        let city = textEnter.text! as String
        ap.FuatchData(cityName: city)
        labelDay.text = Date().dayOfWeek()!
       // labelCountry.text = city
        
    }
    func didupdataweather(weather : item){
        DispatchQueue.main.async {
            self.labelDagre.text = weather.tempratar
            self.tempMax.text = weather.tempma
            self.tempMin.text = weather.tempmi
            self.imageWeather.image = UIImage(systemName: weather.condition)
            
        }
        
    }
    
}
extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }
}


