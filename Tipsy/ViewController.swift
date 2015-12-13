//
//  ViewController.swift
//  Tipsy
//
//  Created by Zhipeng Mei on 11/25/15.
//  Copyright © 2015 Zhipeng Mei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //these are good
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipSliderControl: UISlider!
    @IBOutlet weak var slideLable: UILabel!
    @IBOutlet weak var personSplits: UILabel!   //connect to splitSlider
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitValue: UILabel!
 
    let userDefaults = NSUserDefaults.standardUserDefaults()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        personSplits.text = "1"
        splitValue.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        //let randomPercentage = Double(arc4random_uniform(25)+1)
        //let thisRandomPercentage = (randomPercentage/100)
        
        //let tipPercentages = [0.15, thisRandomPercentage, 0.2]
        //let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

        
        //        //***************** Able to change the default for the minimum but not the maximum
        tipSliderControl.minimumValue = userDefaults.floatForKey("minimum_sliderVal")
        tipSliderControl.maximumValue = userDefaults.floatForKey("maximum_sliderVal")
        //        //***************
        
        let currentTipValue = Int(tipSliderControl.value)
        let tipCal = Double(currentTipValue)
        let tipPercentage = Double(tipCal/100)
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = (billAmount + tip)
        
        let val = Int(splitSlider.value)
        let val2 = Double(val)
        let splitVal = (total/val2)
    
        tipLabel.text = "$\(tipLabel)"
        totalLabel.text = "$\(totalLabel)"
        splitValue.text = "\(splitValue)"
        slideLable.text = "\(currentTipValue)%"
        personSplits.text = "\(val)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitValue.text = String(format: "$%.2f", splitVal)
    }
   
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        billField.becomeFirstResponder()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
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

