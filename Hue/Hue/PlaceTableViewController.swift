//
//  PlaceTableViewController.swift
//  Hue
//
//  Created by Orlando Smits on 02/11/2016.
//  Copyright © 2016 Orlando Smits. All rights reserved.
//

import UIKit

class PlaceTableViewController: UITableViewController {
    
    var places: [Place] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let p1 = Place()
        p1.name = "LA134"
        p1.ipAdress = "http://192.168.1.179/api/"
        p1.username = "80b8a9620291a47fec92fa34484f5b"
        
        self.places.append(p1)
        
        let p2 = Place()
        p2.name = "Avans Aula LA"
        p2.ipAdress = "http://145.48.205.33/api/"
        p2.username = "iYrmsQq1wu5FxF9CPqpJCnm1GpPVylKBWDUsNDhB"
        
        self.places.append(p2)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = (indexPath as NSIndexPath).row
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as! PlaceTableViewCell
        cell.lblPlaceName.text = places[row].name
        
        return cell
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "hueForPlace" {
            if let destination = segue.destination as? HueTableViewController {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let place = places[(indexPath as NSIndexPath).row]
                    destination.baseUrl = place.ipAdress
                    destination.username = place.username
                }
            }
        }
    }
    

}
