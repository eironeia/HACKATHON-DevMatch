//
//  MenuViewController.swift
//  DevMatch
//
//  Created by Cristian Miguel Pinto Quinto on 13/03/16.
//  Copyright © 2016 Eironeia. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var matchesButton: UIButton!
    @IBOutlet weak var createdButtonsButton: UIButton!
    @IBOutlet weak var createEventButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}