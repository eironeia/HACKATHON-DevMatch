//
//  MenuViewController.swift
//  DevMatch
//
//  Created by Cristian Miguel Pinto Quinto on 13/03/16.
//  Copyright © 2016 Eironeia. All rights reserved.
//

import UIKit
import Alamofire

class MenuViewController: UIViewController {
    
    let id :Int?
    
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
    @IBAction func onProfileTapped(sender: AnyObject) {
        Alamofire.request(.GET, URI+"/user/\(self.id)")
            .responseJSON {
                response in
                switch (response.result){
                case .Success(let value):
                    print(value)
                    
                    let surname = value["surname"] as! String
                    
                    if !surname.isEmpty {
                        print(surname)
                        self.surnameField.text = surname
                    }
                    
                    let email = value["email"] as! String
                    if !email.isEmpty {self.emailField.text = email}
                    
                    let phone = value["phone"] as! String
                    if !phone.isEmpty {self.phoneField.text = phone}
                    
                    let age = value["age"] as! String
                    if !age.isEmpty {self.ageField.text = age}
                    
                    /*let city = value["email"] as! String
                    self.emailField.text = email*/
                    
                    
                case .Failure(let error):
                    if let data = response.data, let string = String(data: data, encoding: NSUTF8StringEncoding) {
                        print(string)
                    }
                    print(error)
                }
        }
    }
    @IBAction func onMatchesTapped(sender: AnyObject) {
    }
    @IBAction func onEventsTapped(sender: AnyObject) {
    }
    @IBAction func onCreateEventTapped(sender: AnyObject) {
    }
    
}