//
//  SACSBorderedButton.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 09.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import UIKit

class SACSBorderedButton: UIButton {

    let BUTTON_CORNER_RADIUS: CGFloat = 5.0
    let BUTTON_BORDER_WIDTH: CGFloat = 2.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareBorderOfButton()
    }
    
    func prepareBorderOfButton() {
        layer.cornerRadius = BUTTON_CORNER_RADIUS
        layer.borderWidth = BUTTON_BORDER_WIDTH
        layer.borderColor = UIColor.whiteColor().CGColor
    }
}
