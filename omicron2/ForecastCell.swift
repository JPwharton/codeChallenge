//
//  ForecastCell.swift
//  omicron2
//
//  Created by Jason Picallos on 6/13/17.
//  Copyright © 2017 Greek APP. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell {
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
   
    var weather: Weather?{
        didSet{
            guard let theWeather = weather?.weather else {return}
            guard let humidity = weather?.humidity else {return}
            guard let tempInCelsius = weather?.currentDayTemp else {return}
            guard let date = weather?.date else {return}
            self.weatherLabel.text = theWeather
            self.humidityLabel.text = "\(humidity)%"
            self.tempLabel.text = "\(farenheit(temperature: tempInCelsius)) F"
            self.dateLbl.text = convertTime(dates: date)
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func convertTime(dates:Double)->String{
        let date = Date(timeIntervalSince1970: dates)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let newDate = dateFormatter.string(from: date)
        return newDate
    }
    
    func farenheit(temperature: Double) -> Double {
        let fahrenheitTemperature = temperature * 9 / 5 + 32
        return fahrenheitTemperature.rounded()
    }
  

}
