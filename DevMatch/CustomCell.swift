//
//  CustomCell.swift
//  DevMatch
//
//  Created by Alex Cuello ortiz on 12/3/16.
//  Copyright © 2016 Eironeia. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {


    @IBOutlet var works: UILabel!
    @IBOutlet var yeah: UILabel!
    @IBOutlet var nameEvent: UILabel!
    @IBOutlet var dateEvent: UILabel!
    @IBOutlet var hashtagEvents: UILabel!
    @IBOutlet var descriptionEvent: UILabel!
    @IBOutlet var applyEvent: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
