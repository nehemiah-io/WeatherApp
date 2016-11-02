//
//  tenDayForecastTableViewController.swift
//  MakeWeather-starter
//
//  Created by Nehemiah Odior on 10/24/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
import YWeatherAPI

class tenDayForecastTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        return cell
    }
    
    func getTenDayForecast(location: String) {
        YWeatherAPI.sharedManager().fiveDayForecast(forLocation: "San Francisco", success: {
            (result: [AnyHashable: Any]?) in print(result)
            }, failure: {
                (response: Any?, error: Error?) in
                print(error)
            }
        )
    }
    
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {
        // for now, simply defining the method is sufficient.
        // we'll add the code later
    }
}
