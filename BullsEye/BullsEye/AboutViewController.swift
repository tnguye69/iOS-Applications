//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Tyler Nguyen on 3/16/19.
//  Copyright © 2019 Tyler Nguyen. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {  // info menu screen

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func close(){  // close screen when close button is tapped
        dismiss(animated: true, completion: nil)
    }

}
