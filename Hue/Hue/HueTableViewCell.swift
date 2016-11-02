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
    @IBOutlet var switchOnOff: UISwitch!
    var baseUrl: String = ""
    var username: String = ""
    var HueId : String = "";
  
    
    @IBAction func stateBtnClicked(_ sender: AnyObject) {
        if switchOnOff.isOn{
            let hue = Hue()
            hue.turnOn(url: "\(baseUrl)\(username)/lights/\(HueId)/state/")
        } else {
            let hue = Hue()
            hue.turnOff(url: "\(baseUrl)\(username)/lights/\(HueId)/state/")

        }
        
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
