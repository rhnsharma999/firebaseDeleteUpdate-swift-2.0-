//
//  CardTableViewCell.swift
//  Firebase (swift 2.0)
//
//  Created by Rohan Lokesh Sharma on 08/10/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet var photo: UIImageView!
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var card: UIView!
    
    override func layoutSubviews() {
        photo.layer.cornerRadius = photo.layer.bounds.width/2
        photo.layer.masksToBounds = true
        card.layer.cornerRadius = 10
    }
    override func awakeFromNib() {
        
        
       /* card.layer.shadowRadius = 5
        card.layer.shadowOffset = CGSize.zero
        card.layer.shadowOpacity = 1
        card.layer.shadowColor = UIColor.blackColor().CGColor
        card.backgroundColor = UIColor.whiteColor()*/
        card.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.8)
        
    
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
