//
//  DetailTableViewController.swift
//  WeatherApp
//
//  Created by Daniel Leah on 26/02/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var detailedDay = [DayModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomDayTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailedDay.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CustomDayTableViewCell

        cell.labelDate?.text = detailedDay[indexPath.row].dt_txt
        cell.labelTempreture?.text = detailedDay[indexPath.row].main.temp.description
        cell.labelDescription?.text = detailedDay[indexPath.row].weather[0].descriptionWeather
        cell.labelHumidity?.text = detailedDay[indexPath.row].main.humidity.description
        if detailedDay[indexPath.row].weather[0].main == "Rain" {
            cell.imagedDetails?.image = UIImage(named: "rain")
        }else{
            cell.imagedDetails?.image = UIImage(named: "clear")
        }
        return cell
    }
    
}
