//
//  AlamofireHandler.swift
//  Hue
//
//  Created by Orlando Smits on 31/10/16.
//  Copyright © 2016 Orlando Smits. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class AlamofireHandler {
    
    func doRequest(url: String, parameters: [String : Any], method: HTTPMethod)
    {
        Alamofire.request(url,
                          method: method,
                          parameters: parameters,
                          encoding: JSONEncoding.default).responseJSON { (responseData) -> Void in
                            if((responseData.result.value) != nil) {
                                let results = JSON(responseData.result.value!)
                                print("Response \(results)")
                                
                                }
            
    }
    }

}
