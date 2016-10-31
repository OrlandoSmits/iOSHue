//
//  Hue.swift
//  Hue
//
//  Created by Orlando Smits on 24/10/2016.
//  Copyright © 2016 Orlando Smits. All rights reserved.
//

import Foundation
import UIKit

class Hue {
    var id = String()
    var on = Bool()
    var bri = Int()
    var effect = String()
    var x = Float()
    var y = Float()
    
    let ah = AlamofireHandler()
    
    func turnOn(url: String){
        let parameters = ["on": true]
        ah.doRequest(url: url, parameters: parameters, method: .put)
        on = true
    }
    
    func turnOff(url: String){
        let parameters = ["on": false]
        ah.doRequest(url: url, parameters: parameters, method: .put)
        on = false
    }
    
//    func changeBrightness(url: String, bri: Int){
//        let parameter
//    }
    
    
}
