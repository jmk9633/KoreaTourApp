//
//  InfoDataTableViewCell.swift
//  KoreaTourApp
//
//  Created by 정문기 on 2020/05/15.
//  Copyright © 2020 jmk. All rights reserved.
//

import UIKit
import MapKit

class InfoDataTableViewCell: UITableViewCell {


    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var telLabel: UILabel!
    @IBOutlet var homepageLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var mapView: MKMapView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
