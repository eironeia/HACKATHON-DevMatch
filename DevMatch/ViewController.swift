//
//  ViewController.swift
//  DevMatch
//
//  Created by Alex Cuello ortiz on 12/3/16.
//  Copyright © 2016 Eironeia. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
import Alamofire

//let URI = "http://devmatch-hackaton.herokuapp.com"
let URI = "http://localhost:1337"


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    let lista1 = ["a","b","c"]
    let lista2 = ["1","2","3"]
    var id = -1
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var surnameField: UILabel!
    @IBOutlet weak var emailField: UILabel!
    @IBOutlet weak var phoneField: UILabel!
    @IBOutlet weak var ageField: UILabel!
    @IBOutlet weak var cityField: UILabel!
    @IBOutlet weak var countryField: UILabel!
    @IBOutlet weak var lenguagesField: UILabel!
    @IBOutlet weak var ratingField: UILabel!
    
    let lista3 = ["1","2","3"]


    @IBOutlet weak var registerButton: UIButton!
    
    // Matches List variables
    @IBOutlet weak var tablaUno: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signinTapped(sender: AnyObject) {
        Alamofire.request(.POST, URI+"/login",parameters: ["email": self.username.text!, "password": self.password.text!]).responseJSON {
            response in
            switch (response.result){
            case .Success(let value):
//                print(value)
                
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return lista1.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let celda: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Celda") as! CustomCell

        let celda = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell

        //celda.textLabel?.text = lista1[indexPath.row]
        celda.works.text = lista1[indexPath.row]
        celda.yeah.text = lista2[indexPath.row]
        
        return celda
    }
    
    func fillProfile() {
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let menuViewController = segue.menuViewController as? MenuViewController {
            menuViewController.id = self.id
        }
    }

}

