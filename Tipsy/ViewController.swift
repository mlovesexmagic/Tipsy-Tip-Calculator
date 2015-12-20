//
//  ViewController.swift
//  Tipsy
//
//  Created by Zhipeng Mei on 11/25/15.
//  Copyright © 2015 Zhipeng Mei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //variables from main view Controlloer
    @IBOutlet weak var billField: UITextField!          //main bill field
    @IBOutlet weak var tipLabel: UILabel!               //display Tip amount
    @IBOutlet weak var totalLabel: UILabel!             //display total bill amount
    @IBOutlet weak var tipControl: UISegmentedControl!  //UISegmentController for random percentage
    @IBOutlet weak var tipSliderControl: UISlider!      //UISlider for percentage % tip
    @IBOutlet weak var slideLable: UILabel!             //Displays the current Tip percentage
    @IBOutlet weak var personSplits: UILabel!           //connect to splitSlider
    @IBOutlet weak var splitSlider: UISlider!           //Split UISlider
    @IBOutlet weak var splitValue: UILabel!             //Split amount for each person
    @IBOutlet weak var dummyLabel: UILabel!             //dummy label for animation 1
    @IBOutlet weak var dummyLabel2: UILabel!            //dummy label for animation 2
    @IBOutlet weak var catAnimate: UIImageView!         //animate cat gif
    @IBOutlet weak var toolView: UIView!                //toolView on the bottom half of the screen

    let userDefaults = NSUserDefaults.standardUserDefaults()

    
    //testing
    //**********************************************//
    
    var billFieldLifted = false;
    //**********************************************//
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //displaying the following values as the App launched
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        personSplits.text = "1"
        splitValue.text = "$0.00"
        
        //Animate "Thanks" gif
        //name it the exact same name as your image file
        var imagesNames = ["cat1","cat2","cat3","cat4"]
        
        var images = [UIImage]()
        
        for i in 0..<imagesNames.count{
            images.append(UIImage(named: imagesNames[i])!)
        }
        
        catAnimate.animationImages = images
        catAnimate.animationDuration = 1;
        catAnimate.startAnimating()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func getBillAmount() -> Double{
        let billAmount = NSString(string: billField.text!).doubleValue
        return billAmount
    }
    
    
    
    //main calculation block
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        //calling the show/hide method
        showHide()
    
        //calling the default from AppDelagate to change the UISlider's minimum and the maximum
        tipSliderControl.minimumValue = userDefaults.floatForKey("minimum_sliderVal")
        tipSliderControl.maximumValue = userDefaults.floatForKey("maximum_sliderVal")
        
        //first segment is for normal calculation
        if(tipControl.selectedSegmentIndex == 0){
            
            let currentTipValue = Int(tipSliderControl.value)   //converting the UISlider's value to "Intger"
            let tipCal = Double(currentTipValue)                //converting currentTipValue to "Double"
            let tipPercentage = Double(tipCal/100)              //converting tipCal to "Double" PERCENTAGE by /100
            
            //Update the newest tip percentage
            userDefaults.setDouble(tipPercentage, forKey: "tip_Percentage")
            
            slideLable.text = "\(currentTipValue)%"             //Displays the Tip %
            dummyLabel.text = ""                                //Dummies gotta go
            dummyLabel2.text = ""
        }
        
        
        //second & third are for random Tip percentage
        else{
            
            //generateing a random "Dpuble" value
            let randomPercentage = Double(arc4random_uniform(35)+10)
            
            //convert the random value to percentage
            let thisRandomPercentage = (randomPercentage/100)
            
            let tipPercentages = [thisRandomPercentage, thisRandomPercentage, thisRandomPercentage]
            let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            
            //Update the newest tip percentage
            userDefaults.setDouble(tipPercentage, forKey: "tip_Percentage")
            
            slideLable.text = ""
            
            dummyLabel.text = "FEELING"         //Dummy1 respects the hustle :)
            dummyLabel2.text = "Generous"       //Dummy2 undetstands we all got bills to pay
            
            //animation drop down word
            UIView.animateWithDuration(1, delay: 0.4, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, options: [], animations: {
                self.dummyLabel.center = CGPoint(x:90, y:85 + 820)
                }, completion: nil)
            //animation drop down word2
            UIView.animateWithDuration(2, delay: 0.7, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [], animations: {
                self.dummyLabel2.center = CGPoint(x:270, y:81 + 820)
                }, completion: nil)
        }
        
   
        
        //calling the default percentage
        let currentTipPercentage = userDefaults.doubleForKey("tip_Percentage")
        
        let tip = getBillAmount() * currentTipPercentage                //Calculating the tip amount
        let total = (getBillAmount() + tip)                      //Calculating the total amount
        
        
        //maximum split
        splitSlider.maximumValue = userDefaults.floatForKey("maximum_splitVal")
        
        //Calculating the Splits
        let val = Int(splitSlider.value)                    //Converting the Split slider's to "Integer"
        let val2 = Double(val)                              //Convert val2 to "Double"
        let splitVal = (total/val2)                         //Calculating the Split amount
        
        splitValue.text = "\(splitValue)"                   //Displays the Split amount
        personSplits.text = "\(val)"                        //Displays split with how many people
        tipLabel.text = "$\(tipLabel)"                      //Displaying the Tip amount
        totalLabel.text = "$\(totalLabel)"                  //displays the Total amount
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitValue.text = String(format: "$%.2f", splitVal)
    }
    
    //testing
    //**********************************************************

    
    
    
    
    
    
    
    
    //*********************************************************
    
    
    //when billAmount is >0, show the toolView, else hide
    func showHide() {
        if(getBillAmount() > 0){
            self.toolView.hidden = false

            UIView.animateWithDuration(1.5, animations: {
                self.toolView.alpha = 1.0
                self.toolView.alpha = 1.0
                self.toolView.alpha = 1.0
            })
            
            
        }else{
            self.toolView.hidden = true

            UIView.animateWithDuration(0, animations: {
                self.toolView.alpha = 0
                self.toolView.alpha = 0
                self.toolView.alpha = 0
            })
            
        }
    }
    

  
    
    
    //Make keyboard disappear
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        //bill text field is always the first responder as App launched
        billField.becomeFirstResponder()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
        //calling the showHide method
        showHide()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        
        NSUserDefaults.standardUserDefaults().setObject(NSDate(), forKey: "savedTime")
        NSUserDefaults.standardUserDefaults().setObject(billField.text, forKey: "savedAmt")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    
    

}

