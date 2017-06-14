//
//  ForecastVC.swift
//  omicron2
//
//  Created by Jason Picallos on 6/13/17.
//  Copyright © 2017 Greek APP. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ForecastVC: UITableViewController {
    
    private var weather = [Weather]()
    var detailedWeather : Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weather.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell", for: indexPath)as? ForecastCell else {return UITableViewCell()}
        
        cell.weather = weather[indexPath.item]
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Pass data from cell tapped
        detailedWeather =  weather[indexPath.row]
        self.performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    
    
    func getWeather(){
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            Alamofire.request(url).responseJSON { response in
                if let weatherJSON = response.result.value {
                    let json = JSON(weatherJSON)
                    guard let list = json["list"].array else {return}
                    for day in 0..<list.count{
                        let weatherOfDay = Weather(json: list[day])
                        self?.weather.append(weatherOfDay)
                    }
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let dest = segue.destination as? DetailVC{
                dest.weatherDetailed = detailedWeather
            }
        }
    }

}
