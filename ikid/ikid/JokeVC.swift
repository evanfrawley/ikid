//
//  JokeVC.swift
//  ikid
//
//  Created by Evan on 4/30/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import Foundation
import UIKit

class JokeViewController : UIViewController {
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func actionButton(sender: AnyObject) {
        
    }
    
    
    
    
    @IBAction func back(sender: AnyObject) {
        self.view.removeFromSuperview()
        
    }
    
    override func viewDidLoad() {
        self.textLabel.numberOfLines = 0
    }
}