//
//  CustomDayTableViewCell.swift
//  WeatherApp
//
//  Created by Daniel Leah on 25/02/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class CustomDayTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageViewWeatherType: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
