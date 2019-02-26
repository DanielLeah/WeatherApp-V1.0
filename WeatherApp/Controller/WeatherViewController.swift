//
//  ViewController.swift
//  WeatherApp
//
//  Created by Daniel Leah on 25/02/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    var dataAPI : DataAPI?
    var arrayMiddleOfDay = [DayModel]()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        fetchJSON()
    }
    
    
    fileprivate func fetchJSON(){
        let urlString = "https://samples.openweathermap.org/data/2.5/forecast?q=London,UK&appid=40ead433db85d746bf204d9f86920d52"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("failed to get the data from URL:", err)
                    return
                }
                
                guard let data = data else {return}
                do {
                    let decoder = JSONDecoder()
                    self.dataAPI = try decoder.decode(DataAPI.self, from: data)
                    self.createMiddleOfDay()
                    self.tableView.reloadData()
                }catch let jsonErr {
                    print("Failed to decode:", jsonErr)
                }
            }
            }.resume()
    }

    func configureTableView(){
        tableView.rowHeight = 60.0
    }
    
    func createMiddleOfDay(){
        guard let arrayDays = dataAPI?.list else {return}
        for day in arrayDays {
            if day.dt_txt.suffix(8) == "12:00:00" {
                arrayMiddleOfDay.append(day)
            }
        }
    }
    
    func createDetailedDay(dayString:String)->[DayModel]{
        var detailArray = [DayModel]()
        if let arrayDays = dataAPI?.list {
            for day in arrayDays {
                if day.dt_txt.prefix(10) == dayString {
                    detailArray.append(day)
                }
            }
        }
        return detailArray
    }
}
//Mark: TableView Data source and delegate

extension WeatherViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMiddleOfDay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) //as! CustomDayTableViewCell
        cell.textLabel?.text = arrayMiddleOfDay[indexPath.row].weather[0].descriptionWeather
        cell.detailTextLabel?.text = arrayMiddleOfDay[indexPath.row].dt_txt
        if arrayMiddleOfDay[indexPath.row].weather[0].main == "Rain" {
            cell.imageView?.image = UIImage(named: "rain")
        }else{
            cell.imageView?.image = UIImage(named: "clear")
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //performSegue(withIdentifier: "GoToDetails", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DetailTableViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.detailedDay = createDetailedDay(dayString: String(arrayMiddleOfDay[indexPath.row].dt_txt.prefix(10)))
        }
        
    }
    
}
