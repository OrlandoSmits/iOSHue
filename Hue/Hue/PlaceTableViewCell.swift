//
//  PlaceTableViewCell.swift
//  Hue
//
//  Created by Orlando Smits on 02/11/2016.
//  Copyright © 2016 Orlando Smits. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    @IBOutlet var lblPlaceName: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

