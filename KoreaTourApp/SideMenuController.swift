//
//  SideMenuController.swift
//  KoreaTourApp
//
//  Created by 정문기 on 2020/06/16.
//  Copyright © 2020 jmk. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuController : SideMenuNavigationController {
    
    override func viewDidLoad() {
        presentationStyle = .menuSlideIn
        statusBarEndAlpha = 0
        
    }
    
}
