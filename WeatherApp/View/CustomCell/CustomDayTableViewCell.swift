//
//  CustomDayTableViewCell.swift
//  WeatherApp
//
//  Created by Daniel Leah on 25/02/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class CustomDayTableViewCell: UITableViewCell {

    @IBOutlet weak var imagedDetails: UIImageView!
    
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    @IBOutlet weak var labelTempreture: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
