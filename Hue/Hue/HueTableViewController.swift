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
    
    func getState(par: String)
    {

        let url = "http://192.168.2.27:80/api/newdeveloper/lights/\(par)/state"
        Alamofire.request(url,
                          method: .get,
                          encoding: URLEncoding.default).responseJSON { (responseData) -> Void in
                            if((responseData.result.value) != nil) {
                                let results = JSON(responseData.result.value!)
                                for(key, result) in results["lights"] {
                                    for light in result {
//                                        let on = light["state"]["on"].bool                                  
                                    }
                                
                                }
                            }
                            
        }
        

    }
    func getHues() {
        
//        let url = "http://192.168.1.179/api/80b8a9620291a47fec92fa34484f5b/lights"
            let url = "http://192.168.2.27:80/api/newdeveloper/lights"

        
        Alamofire.request(url,
                          method: .get,
                          encoding: URLEncoding.default).responseJSON { (responseData) -> Void in
                            if((responseData.result.value) != nil) {
                                let results = JSON(responseData.result.value!)
//                                print(results)
                                
                                for(key, result) in results {
                                    let hue = Hue()
                                    let id = Int(key)
                                    
                                    let state = self.getState(par: key)
//                                    print(state)
                                    
                                        
                            
                                    let on = result["state"]["on"].bool
                                    print(on)
//                                    let bri = result["bri"].int
                                    
                                    hue.id = id!
//                                    hue.bri = bri!
//                                    hue.on = on!
                                    
                                    self.hues.append(hue)
                                    
                                    self.tableView.reloadData()

                                }
           
                            }
                            
                                
                            
                            
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

        let cell = tableView.dequeueReusableCell(withIdentifier: "hueCell", for: indexPath) as! HueTableViewCell
           cell.lblID.text = String(hues[row].id)
//           cell.lblState.text = String(hues[row].on)
        
        return cell;
        }
    
    
    }


