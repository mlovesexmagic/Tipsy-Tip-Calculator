//
//  SettingsViewController.swift
//  Tipsy
//
//  Created by Zhipeng Mei on 12/11/15.
//  Copyright © 2015 Zhipeng Mei. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    //animate gif
    @IBOutlet weak var imageView: UIImageView!
    
    //import variable from settingsViewController
    @IBOutlet weak var slideMinVal: UITextField!        //text field minimum %
    @IBOutlet weak var slideMaxVal: UITextField!        //text field maximum %
   
    //only need to edit the max because the min has to be at least one
    //also people < 10 is pretty common, dont stress about Min Split
    @IBOutlet weak var splitMaxVal: UITextField!        //text field maximum split
    
    //creates float variables
    var minimumSliderVal: Float!
    var maximumSliderVal: Float!
    var maximumSplit: Float!
    
    //an alert message variable
    var alertController:UIAlertController?
    
    //userDefaults
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func save(sender: UIButton) {

        //converting text fields string values to Float values
        let minimumSliderVal =  NSString(string: slideMinVal.text!).floatValue
        let maximumSliderVal =  NSString(string: slideMaxVal.text!).floatValue
        let maximumSplit =  NSString(string: splitMaxVal.text!).floatValue
        
        if(minimumSliderVal < maximumSliderVal && maximumSplit > 0){
            
            //setting new UISlider defaults for new percentages
            userDefaults.setFloat(minimumSliderVal, forKey: "minimum_sliderVal")
            userDefaults.setFloat(maximumSliderVal, forKey: "maximum_sliderVal")
            userDefaults.setFloat(maximumSplit, forKey: "maximum_splitVal")
            
            
            //display string from text field amount % on setting page
            userDefaults.setObject(slideMinVal.text, forKey: "min_Slide")
            userDefaults.setObject(slideMaxVal.text, forKey: "max_Slide")
            
            
            //display text field string values on the same textbox, just keeping/saving it there for record
            userDefaults.setObject(splitMaxVal.text, forKey: "max_Split")
            
  
            //overpower sync, insurance code
            userDefaults.synchronize()
            
            
            
        }else{
            //This error message appear when min% > max%
            let titleText = "Banananananananan"                 //silly tile
            let messageText = "Min % has to be less than Max %. \nMax Split has to be >0." //an corresponding error message
            let okText = "OK"                                   //simply a button to make message to disappear
            
            //setting up the alert message
            let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: UIAlertControllerStyle.Alert)
            let okayButton = UIAlertAction(title: okText, style: UIAlertActionStyle.Cancel, handler: nil)
            
            //Ok button appear on the alert message
            alert.addAction(okayButton)
            
            //Alert message
            presentViewController(alert, animated: true, completion: nil)
        }
    
}


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

     
        //Animate "Thanks" gif
        var imagesNames = ["1","2","3","4","5","6","7"]
        var images = [UIImage]()
        
        for i in 0..<imagesNames.count{
            images.append(UIImage(named: imagesNames[i])!)
        }
        imageView.animationImages = images
        imageView.startAnimating()
        
        
        
        //change the Global default to user input that we converted to float variables earlier
        let minSlide = userDefaults.stringForKey("min_Slide")
        let maxSlide = userDefaults.stringForKey("max_Slide");        let maxSplit = userDefaults.stringForKey("max_Split")
        
        //displaying the user input on the text field
        slideMinVal.text = minSlide
        slideMaxVal.text = maxSlide
        splitMaxVal.text = maxSplit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //keyboard disappear when user tap anywhere on the screen
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    //animation part
    

}
