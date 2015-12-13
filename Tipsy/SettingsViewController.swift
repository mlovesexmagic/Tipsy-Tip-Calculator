//
//  SettingsViewController.swift
//  Tipsy
//
//  Created by Zhipeng Mei on 12/11/15.
//  Copyright © 2015 Zhipeng Mei. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var slideMinVal: UITextField!
    @IBOutlet weak var slideMaxVal: UITextField!
    
    var minimumSliderVal: Float!
    var maximumSliderVal: Float!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func save(sender: UIButton) {
 
// optional from CCSF walk through
        let minimumSliderVal =  NSString(string: slideMinVal.text!).floatValue
        let maximumSliderVal =  NSString(string: slideMaxVal.text!).floatValue
        
        //*****************************
        //setting new UISlider defaults
        userDefaults.setFloat(minimumSliderVal, forKey: "minimum_sliderVal")
        userDefaults.setFloat(maximumSliderVal, forKey: "maximum_sliderVal")
        //*********************************
        
        //display text only amount % on setting page
        userDefaults.setObject(slideMinVal.text, forKey: "minSlide")
        userDefaults.setObject(slideMaxVal.text, forKey: "maxSlide")
        userDefaults.synchronize()
}


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let minSlide = userDefaults.stringForKey("minSlide")
        
        slideMinVal.text = minSlide
        
        let maxSlide = userDefaults.stringForKey("maxSlide")
        
        slideMaxVal.text = maxSlide
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onEditingSettingChanged(sender: AnyObject) {
       
        
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
