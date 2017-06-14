//
//  DetailVC.swift
//  omicron2
//
//  Created by Jason Picallos on 6/13/17.
//  Copyright © 2017 Greek APP. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var weatherDetailed : Weather?
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var morningTempLabel: UILabel!
    @IBOutlet weak var eveningTempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var currentTemp: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let details = weatherDetailed else {return}
        dateLabel.text = "\(details.date)"
        highTempLabel.text = "High Temp: \(farenheit(temperature: details.highTemp)) F"
        lowTempLabel.text = "Low Temp: \(farenheit(temperature: details.lowTemp)) F"
        morningTempLabel.text = "Morning Temp: \(farenheit(temperature: details.mornTemp)) F"
        eveningTempLabel.text = "Evening Temp: \(farenheit(temperature: details.eveningTemp)) F"
        currentTemp.text = "Currently: \(farenheit(temperature: details.currentDayTemp)) F"
        print(details)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func farenheit(temperature: Double) -> Double {
        let fahrenheitTemperature = temperature * 9 / 5 + 32
        return fahrenheitTemperature.rounded()
    }
    
}

