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
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.register(UINib(nibName: "CustomDayTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
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
}
//Mark: TableView Data source

extension WeatherViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataAPI = dataAPI?.list.count else {
            return 1
        }
        return dataAPI
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) //as! CustomDayTableViewCell
        cell.textLabel?.text = dataAPI?.list[indexPath.row].weather[0].description
        cell.detailTextLabel?.text = dataAPI?.list[indexPath.row].dt_txt ?? "No Data"
        if dataAPI?.list[indexPath.row].weather[0].main == "Rain" {
            cell.imageView?.image = UIImage(named: "rain")
        }else{
            cell.imageView?.image = UIImage(named: "clear")
        }
        return cell
    }
    
    
}
