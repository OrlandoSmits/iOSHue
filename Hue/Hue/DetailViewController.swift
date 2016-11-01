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
    @IBOutlet var btnColorloopTrue: UIButton!
    @IBOutlet var btnColorloopFalse: UIButton!
    @IBOutlet var lblHueName: UILabel!
    @IBOutlet var btnAlertTrue: UIButton!
    @IBOutlet var btnAlertFalse: UIButton!

    @IBAction func sliderBriValueChanged(_ sender: UISlider) {
                let bri = Int(sliderBri.value)
        
                hue?.changeBrightness(url: "http://192.168.1.179/api/80b8a9620291a47fec92fa34484f5b/lights/\(hue!.id)/state/", bri: bri)
    }
    
    @IBAction func sliderSatValueChanged(_ sender: UISlider) {
                let sat = Int(sliderSat.value)
                hue?.changeSaturation(url: "http://192.168.1.179/api/80b8a9620291a47fec92fa34484f5b/lights/\(hue!.id)/state/", sat: sat)
    }
    @IBAction func sliderHueValueChanged(_ sender: UISlider) {
                let mHue = Int(sliderHue.value)
        hue?.setColor(url: "http://192.168.1.179/api/80b8a9620291a47fec92fa34484f5b/lights/\(hue!.id)/state/", hue: mHue)
    }
    
    @IBAction func btnTrueOnClick(_ sender: UIButton) {
        hue?.setColorloop(url: "http://192.168.1.179/api/80b8a9620291a47fec92fa34484f5b/lights/\(hue!.id)/state/", b: true)
    }
    
    @IBAction func btnFalseOnClick(_ sender: UIButton) {
        hue?.setColorloop(url: "http://192.168.1.179/api/80b8a9620291a47fec92fa34484f5b/lights/\(hue!.id)/state/", b: false)
    }

    @IBAction func btnTrueClick(_ sender: UIButton) {
        hue?.setAlert(url: "http://192.168.1.179/api/80b8a9620291a47fec92fa34484f5b/lights/\(hue!.id)/state/", b: true)
    }
    
    @IBAction func btnFalseClick(_ sender: UIButton) {
                hue?.setAlert(url: "http://192.168.1.179/api/80b8a9620291a47fec92fa34484f5b/lights/\(hue!.id)/state/", b: false)
    }
    var hue : Hue?

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderBri.setValue(Float((hue?.brightness)!), animated: false)
       sliderSat.setValue(Float((hue?.sat)!), animated: false)
        lblHueName.text = hue!.name
                
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
