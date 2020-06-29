//
//  MainHeaderTableViewCell.swift
//  KoreaTourApp
//
//  Created by 정문기 on 2020/05/24.
//  Copyright © 2020 jmk. All rights reserved.
//

import UIKit

class MainHeaderTableViewCell: UITableViewCell {

    @IBOutlet var searchButton: UIButton!
    @IBOutlet var subTemperatureLabel: UILabel!
    @IBOutlet var mainTemperatureLabel: UILabel!
    @IBOutlet var mainSubTitle: UILabel!
    @IBOutlet var mainTitle: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var mainbutton: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
