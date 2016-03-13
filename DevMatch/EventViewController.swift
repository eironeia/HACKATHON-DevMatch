//
//  ViewController.swift
//  DevMatch
//
//  Created by Alex Cuello ortiz on 12/3/16.
//  Copyright © 2016 Eironeia. All rights reserved.
//

import UIKit


class EventViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let lista1 = ["Alex Eironeia","Dirken Meyerofer","Michael Pinto", "Jose dormidron"]
    let lista2 = ["10/5/2016 - 13/5/2016","23/4/2016 - 25/4/2016","5/7/9 - 7/7/9"]
    let lista3 = ["c++, developer,app","IoT, Hackathon,","Fintech, money, app, developer"]
    let lista4 = ["Finding C++ Developer to develop one amazing app.","Finding IoT dev to StartHack17'","Fintech people to incredible project"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista1.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        
        let celdaEvent = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath) as! CustomCell
        //celda.textLabel?.text = lista1[indexPath.row]
        celdaEvent.nameEvent.text = lista1[indexPath.row]
        celdaEvent.dateEvent.text = lista2[indexPath.row]
        celdaEvent.descriptionEvent.text = lista3[indexPath.row]
        celdaEvent.hashtagEvents.text = lista4[indexPath.row]

        
        return celdaEvent
    }
    
}

