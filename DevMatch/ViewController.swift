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

    let lista1 = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]
    let lista2 = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","ñ","o"]

    @IBOutlet weak var registerButton: UIButton!
    
    // Matches List variables
    @IBOutlet weak var tablaUno: UITableView!
    @IBOutlet weak var tablaDos: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      //  self.tablaDos.dataSource = self
        //self.tablaDos.delegate = self
        
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
                print(value)
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
                    print(value)
                case .Failure(let error):
                    if let data = response.data, let string = String(data: data, encoding: NSUTF8StringEncoding) {
                        print(string)
                    }
                    print(error)
                }
        }

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.tablaUno {
            return lista1.count
        } else {
            return lista2.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let celda: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Celda")!
        
        if tableView == self.tablaUno {
            celda.textLabel?.text = lista1[indexPath.row]
        } else {
            celda.textLabel?.text = lista2[indexPath.row]
        }
        return celda
    }

}

