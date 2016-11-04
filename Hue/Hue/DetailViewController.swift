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
    @IBOutlet var sliderSat: UISlider!
    @IBOutlet var sliderHue: UISlider!
    @IBOutlet var lblHueName: UILabel!
    @IBOutlet var switchColorLoop: UISwitch!
    @IBOutlet weak var switchAlert: UISwitch!
    
    var baseUrl: String = ""
    var username: String = ""
    
    @IBAction func switchAlertToggle(_ sender: UISwitch) {
        if(sender.isOn){
            hue?.setAlert(url: "\(baseUrl)\(username)/lights/\(hue!.id)/state/", b: true)
        } else {
            hue?.setAlert(url: "\(baseUrl)\(username)/lights/\(hue!.id)/state/", b: false)
        }
    }
    
    @IBAction func switchToggle(_ sender: UISwitch) {
        if(sender.isOn){
            hue?.setColorloop(url: "\(baseUrl)\(username)/lights/\(hue!.id)/state/", b: true)
        } else {
            hue?.setColorloop(url: "\(baseUrl)\(username)/lights/\(hue!.id)/state/", b: false)
        }
    }

    @IBAction func sliderBriValueChanged(_ sender: UISlider) {
                let bri = Int(sliderBri.value)
                print("Brightness: \(bri)")
                hue?.changeBrightness(url: "\(baseUrl)\(username)/lights/\(hue!.id)/state/", bri: bri)
    }
    
    @IBAction func sliderSatValueChanged(_ sender: UISlider) {
                let sat = Int(sliderSat.value)
                print("Saturation: \(sat)")
                hue?.changeSaturation(url: "\(baseUrl)\(username)/lights/\(hue!.id)/state/", sat: sat)
    }
    @IBAction func sliderHueValueChanged(_ sender: UISlider) {
                let mHue = Int(sliderHue.value)
                print("Hue: \(mHue)")
        hue?.setColor(url: "\(baseUrl)\(username)/lights/\(hue!.id)/state/", hue: mHue)
    }
    var hue : Hue?

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderBri.setValue(Float((hue!.brightness)), animated: false)
        sliderSat.setValue(Float((hue!.sat)), animated: false)
        print("Hue: \(hue?.hue)")
        sliderHue.setValue(Float((hue!.hue)), animated: false)
        lblHueName.text = hue!.name
                
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        hue?.setDisco(url: "\(baseUrl)\(username)/lights/\(hue!.id)/state/")
    }

}
