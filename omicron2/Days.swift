//
//  Days.swift
//  omicron2
//
//  Created by Jason Picallos on 6/13/17.
//  Copyright © 2017 Greek APP. All rights reserved.
//

import Foundation
import SwiftyJSON




struct PropertyKey{
        static let weather = "weather"
        static let description = "description"
        static let temp = "temp"
        static let current = "day"
        static let humidity = "humidity"
        static let morningTemp = "morn"
        static let eveningTemp = "eve"
        static let highTemp = "max"
        static let lowTemp = "min"
        static let date = "dt"
}

struct Weather {
    var weather: String
    var humidity:Int
    var currentDayTemp:Double
    var highTemp:Double
    var lowTemp: Double
    var mornTemp:Double
    var eveningTemp:Double
    var date:Double
    
    init(json:JSON) {
        //Get inside weather array
        let weather = json[PropertyKey.weather].array
        let description = weather?[0][PropertyKey.description].string ?? "" //always only one dictionary
        let tempCelsius = json[PropertyKey.temp].dictionary ?? [:]
        
        
        self.weather = description
        self.humidity = json[PropertyKey.humidity].int ?? 0
        self.currentDayTemp = tempCelsius[PropertyKey.current]?.double ?? 0.00
        self.mornTemp = tempCelsius[PropertyKey.morningTemp]?.double ?? 0.00
        self.eveningTemp = tempCelsius[PropertyKey.eveningTemp]?.double ?? 0.00
        self.highTemp = tempCelsius[PropertyKey.highTemp]?.double ?? 0.00
        self.lowTemp = tempCelsius[PropertyKey.lowTemp]?.double ?? 0.00
        self.date = json[PropertyKey.date].double ?? 0.00
      
   }
    
   
}
