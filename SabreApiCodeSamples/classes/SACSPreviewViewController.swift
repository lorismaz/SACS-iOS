//
//  SACSPreviewViewController.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 09.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import UIKit

class SACSPreviewViewController: UIViewController {
    var JSONToShow: String!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textViewWithJSON.text = JSONToShow
    }
    
    @IBOutlet weak var textViewWithJSON: UITextView!
}
