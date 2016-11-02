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
    var baseUrl: String = ""
    var username: String = ""


    func getHues(url: String, username: String) {
       
        let url = "\(url)\(username)/lights"
        print(url)

        Alamofire.request(url,
                          method: .get,
                          encoding: URLEncoding.default).responseJSON { (responseData) -> Void in
                            if((responseData.result.value) != nil) {
                                let results = JSON(responseData.result.value!)
                                
                                for(key, result) in results {
                                    let hue = Hue()
                                    let id = String(key)
                                    let name = result["name"].string
                                    let on = result["state"]["on"].bool
                                    let bri = result["state"]["bri"].int
                                    let sat = result["state"]["sat"].int
                                    print(sat)
                                    
                                    let mHue = result["state"]["hue"].int
                                    print(mHue)
                                    hue.id = id!
                                    hue.name = name!
                                    hue.brightness = bri!
                                    hue.on = on!
                                    
                                    
                                    self.hues.append(hue)
                                    
                                   
                                }
                                self.tableView.reloadData()
                            }
                            
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getHues(url: self.baseUrl, username: self.username)

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
        tableView.isUserInteractionEnabled = true
        let row = (indexPath as NSIndexPath).row

        let cell = tableView.dequeueReusableCell(withIdentifier: "hueViewCell", for: indexPath)
            as! HueTableViewCell
        
           cell.lblID.text = hues[row].name
           cell.switchOnOff.setOn(hues[row].on, animated: false)
           cell.HueId = hues[row].id
           cell.baseUrl = self.baseUrl
           cell.username = self.username
        
        return cell;
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "hueDetail" {
            if let destination = segue.destination as? DetailViewController {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let hue = hues[(indexPath as NSIndexPath).row]
                    destination.hue = hue
                    destination.baseUrl = self.baseUrl
                    destination.username = self.username
                }
            }
        }
    }
    
    }


