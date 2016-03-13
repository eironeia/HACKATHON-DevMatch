//
//  registrationViewController.swift
//  DevMatch
//
//  Created by Alex Cuello ortiz on 13/3/16.
//  Copyright © 2016 Eironeia. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
import Alamofire

//let URI = "http://devmatch-hackaton.herokuapp.com"
let URI = "http://localhost:1337"
class registrationViewController: UIViewController {
    
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var surnameField: UILabel!
    @IBOutlet weak var emailField: UILabel!
    @IBOutlet weak var phoneField: UILabel!
    @IBOutlet weak var ageField: UILabel!
    @IBOutlet weak var cityField: UILabel!
    @IBOutlet weak var countryField: UILabel!
    @IBOutlet weak var lenguagesField: UILabel!
    @IBOutlet weak var ratingField: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onRegisterTapped(sender: AnyObject) {
        Alamofire.request(.POST, URI+"/user", parameters: ["email": self.username.text!, "password": self.password.text!])
            .responseJSON {
                response in
                switch (response.result){
                case .Success(let value):
                    //                    print(value)
                    
                    let jsonObject = value["user"] as! [String:AnyObject]
                    self.id = jsonObject["id"] as! Int
                    print("id \(self.id)")
                    if self.id > 0 {
                        self.fillProfile()
                    }
                    
                    
                case .Failure(let error):
                    if let data = response.data, let string = String(data: data, encoding: NSUTF8StringEncoding) {
                        print(string)
                    }
                    print(error)
                }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
