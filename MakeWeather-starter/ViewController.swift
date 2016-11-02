//
//  ViewController.swift
//  MakeWeather-starter
//
//  Created by Nikolas Burk on 19/09/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
import YWeatherAPI

class ViewController: UIViewController {
    // Input City Text Field
    @IBOutlet weak var cityTextField: UITextField!
    // Initial location (city)
    var city: String = ""
    
    // Display Weather Data For City
    @IBOutlet weak var lowestTempLabel: UILabel!
    @IBOutlet weak var highestTempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // Set the Location for Particular City
    @IBAction func goSetCityButton(_ sender: AnyObject) {
        city = cityTextField.text!
        self.getForecast(city: city)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the labels as empty (default) upon loading the app.
        lowestTempLabel.text = ""
        highestTempLabel.text = ""
        descriptionLabel.text = ""
    }
    
    // MARK: getter and setter functions for weather.
    func getForecast(city: String) {
        YWeatherAPI.sharedManager().todaysForecast(forLocation: city, success: {
        (result: [AnyHashable: Any]?) in
            self.setForecast(result: result!)
        }, failure: {
        (response: Any?, error: Error?) in print(error)
        })
    }
    
    func setForecast(result: [AnyHashable: Any]) {
        self.lowestTempLabel.text = (result["lowTemperatureForDay"] as! String?)! + "°"
        self.highestTempLabel.text = (result["highTemperatureForDay"] as! String?)! + "°"
        self.descriptionLabel.text = result["shortDescription"] as! String?
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tenDayForecast" {
            print("Ten day forecast button tapped")
        }
    }
}
