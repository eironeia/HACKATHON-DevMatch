//
//  ViewController.swift
//  DevMatch
//
//  Created by Alex Cuello ortiz on 12/3/16.
//  Copyright © 2016 Eironeia. All rights reserved.
//

import UIKit


class EventViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let lista1 = ["a","b","c"]
    let lista2 = ["1","2","3"]
    let lista3 = ["Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos. Eu sit tincidunt incorrupte definitionem, vis mutat affert percipit cu, eirmod consectetuer signiferumque eu per. In usu latine equidem dolores. Quo no falli viris intellegam, ut fugit veritus placerat per.","2","3"]
    
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
        celdaEvent.hashtagEvents.text = lista1[indexPath.row]

        
        return celdaEvent
    }
    
}

