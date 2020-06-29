//
//  HeaderSectionTableViewCell.swift
//  KoreaTourApp
//
//  Created by 정문기 on 2020/05/15.
//  Copyright © 2020 jmk. All rights reserved.
//

import UIKit

class HeaderSectionTableViewCell: UITableViewCell {

    @IBOutlet var headerTitleLabel: UILabel!
    @IBOutlet var headerButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
