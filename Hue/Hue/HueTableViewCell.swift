//
//  HueTableViewCell.swift
//  Hue
//
//  Created by Orlando Smits on 24-10-16.
//  Copyright © 2016 Orlando Smits. All rights reserved.
//

import UIKit

class HueTableViewCell: UITableViewCell {
    
    @IBOutlet var lblID: UILabel!
    @IBOutlet var lblState: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
