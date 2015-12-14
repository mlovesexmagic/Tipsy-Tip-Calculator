//
//  SettingsViewController.swift
//  Tipsy
//
//  Created by Zhipeng Mei on 12/11/15.
//  Copyright © 2015 Zhipeng Mei. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //import variable from settingsViewController
    @IBOutlet weak var slideMinVal: UITextField!
    @IBOutlet weak var slideMaxVal: UITextField!
    
    //creates float variables
    var minimumSliderVal: Float!
    var maximumSliderVal: Float!
    
    //an alert message variable
    var alertController:UIAlertController?
    
    //userDefaults
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func save(sender: UIButton) {

        //converting text fields string to Float values
        let minimumSliderVal =  NSString(string: slideMinVal.text!).floatValue
        let maximumSliderVal =  NSString(string: slideMaxVal.text!).floatValue
        
        if(minimumSliderVal < maximumSliderVal){
            //setting new UISlider defaults
            userDefaults.setFloat(minimumSliderVal, forKey: "minimum_sliderVal")
            userDefaults.setFloat(maximumSliderVal, forKey: "maximum_sliderVal")
            
            //display string from text field amount % on setting page
            userDefaults.setObject(slideMinVal.text, forKey: "minSlide")
            userDefaults.setObject(slideMaxVal.text, forKey: "maxSlide")
            userDefaults.synchronize()
        }else{
            let titleText = "Banananananananan"
            let messageText = "Min % has to be less than Max %"
            let okText = "OK"
            
            let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: UIAlertControllerStyle.Alert)
            let okayButton = UIAlertAction(title: okText, style: UIAlertActionStyle.Cancel, handler: nil)
            
            alert.addAction(okayButton)
            
            presentViewController(alert, animated: true, completion: nil)
        }
    
}


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //change the Global default to user input that we converted to float variables earlier
        let minSlide = userDefaults.stringForKey("minSlide")
        let maxSlide = userDefaults.stringForKey("maxSlide")
        
        //displaying the user input on the text field
        slideMinVal.text = minSlide
        slideMaxVal.text = maxSlide
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}
