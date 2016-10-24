//
//  HueTableViewController.swift
//  Hue
//
//  Created by Orlando Smits on 24/10/2016.
//  Copyright © 2016 Orlando Smits. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HueTableViewController: UITableViewController {
    
    var hues: [Hue] = []
    
    
    func getHues() {
        
        let url = "http://192.168.1.179/api/80b8a9620291a47fec92fa34484f5b/lights"

        
        Alamofire.request(url,
                          method: .get,
                          encoding: URLEncoding.default).responseJSON { (responseData) -> Void in
                            if((responseData.result.value) != nil) {
                                let results = JSON(responseData.result.value!)
                                print(results)
                                
                                let hue = Hue()
                                for(key, result) in results {
                                    let id = Int(key)
                                    let on = result["on"].bool
                                    let bri = result["bri"].int
                                    
                                    hue.id = id!
                                    hue.bri = bri!
                                    hue.on = on!
                                    
                                    self.hues.append(hue)
                                    
                                    self.tableView.reloadData()
//                                    if let name = subJson["name"].string {
//                                        print(name)
//                                    } else {
//                                        print("Niets")
//                                    }
                                }
           
                            }
                            
//                            if let json = JSON(response.result.value) {
//                                print("Json : \(json)")
//                                let hue = Hue()
                            
                                
//                                for j in json {
//                                    let resultIndex = j.index(of: 0)
//                                    print("Lampje : \(resultIndex)")
//                                }

//                                let result = results[0] as! NSDictionary
                                
//                                print("Results : \(results)")
                                
                            
                            
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getHues()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = (indexPath as NSIndexPath).row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonTableViewCell
            cell.personFirstName.text = persons[row].mFirstName
            cell.personLastName.text = persons[row].mLastName
            cell.personEmail.text = persons[row].mEmail
     
        }
    }

}
