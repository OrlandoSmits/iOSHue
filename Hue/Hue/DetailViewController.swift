//
//  DetailViewController.swift
//  Hue
//
//  Created by Orlando Smits on 31/10/16.
//  Copyright © 2016 Orlando Smits. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var sliderBri: UISlider!

    @IBAction func sliderValueChanged(_ sender: AnyObject) {
        let bri = Int(sliderBri.value)
      
        hue?.changeBrightness(url: "http://192.168.1.179/api/80b8a9620291a47fec92fa34484f5b/lights/\(hue!.id)/state/", bri: bri)
        
    }
    
    var hue : Hue?

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderBri.setValue(Float((hue?.brightness)!), animated: false)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
