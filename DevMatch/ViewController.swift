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

let URI = "http://devmatch-hackaton.herokuapp.com"


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    let lista1 = ["a","b","c"]
    let lista2 = ["1","2","3"]

    @IBOutlet weak var registerButton: UIButton!
    
    // Matches List variables
    @IBOutlet weak var tablaUno: UITableView!
    @IBOutlet weak var tablaDos: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*func login() {
        Alamofire.request(.GET, URIparameters: ["name": self.username.text!, "password": self.password.text!]).responseJSON {
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
    }*/
    
    @IBAction func onRegisterTapped(sender: AnyObject) {
        Alamofire.request(.POST, URI+"/user", parameters: ["username": self.username.text!, "password": self.password.text!])
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

}

