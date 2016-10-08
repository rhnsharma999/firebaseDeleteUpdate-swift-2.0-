//
//  MessagesTableViewCell.swift
//  Firebase (swift 2.0)
//
//  Created by Rohan Lokesh Sharma on 08/10/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {
    
    @IBOutlet var card:UIView!
    @IBOutlet var firstLabel:UILabel!
    @IBOutlet var secondLabel:UILabel!
    @IBOutlet var desc:UITextView!
    @IBOutlet var date:UILabel!
    @IBOutlet var photo:UIImageView!
    
    override func awakeFromNib() {
        
        
        card.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.8)
        
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
