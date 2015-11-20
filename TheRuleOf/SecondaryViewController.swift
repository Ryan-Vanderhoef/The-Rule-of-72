//
//  SecondaryViewController.swift
//  TheRuleOf
//
//  Created by Ryan Vanderhoef on 8/7/15.
//  Copyright (c) 2015 Ryan Vanderhoef. All rights reserved.
//

import UIKit

class SecondaryViewController: UIViewController {

    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var gainLabel: UILabel!
    
    @IBOutlet weak var rateSlider: UISlider!
    @IBAction func rateSliderAction(sender: AnyObject) {
        rateLabel.text = "\(floor(rateSlider.value*10)/10)%"
        
        resultLabel.text = "Time for investment to increase \(floor(gainSlider.value*10)/10)x:"
        results2Label.text = "\(log(floor(gainSlider.value*10)/10)/log(1+(floor((floor(rateSlider.value*10)/10)*10)/10)/100)) years"
    }
    
    @IBOutlet weak var gainSlider: UISlider!
    @IBAction func gainSliderAction(sender: AnyObject) {
        gainLabel.text = "\(floor(gainSlider.value*10)/10)x"
        
        resultLabel.text = "Time for investment to increase \(floor(gainSlider.value*10)/10)x:"
        results2Label.text = "\(log(floor(gainSlider.value*10)/10)/log(1+(floor(rateSlider.value*10)/10)/100)) years"
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var results2Label: UILabel!
    
    @IBAction func resetButton(sender: AnyObject) {
        rateSlider.setValue(6.0, animated: true)
        gainSlider.setValue(2.0, animated: true)
        
        rateLabel.text = "\(floor(rateSlider.value*10)/10)%"
        gainLabel.text = "\(floor(gainSlider.value*10)/10)x"
        resultLabel.text = "Time for investment to increase \(floor(gainSlider.value*10)/10)x:"
        results2Label.text = "\(log(floor(gainSlider.value*10)/10)/log(1+(floor(rateSlider.value*10)/10)/100)) years"
    }
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func shareButton(sender: AnyObject) {
//        let textToShare = "With a yearly compound interest rate of \(rateSlider.value)%, it will take \(log(gainSlider.value)/log(1+rateSlider.value/100)) years for an investment to increase \(gainSlider.value)x!\n\nDownload 'The Rule of 72' from the App Store now."
//        let objectsToShare = [textToShare]
//        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
//        activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
//        self.presentViewController(activityVC, animated: true, completion: nil)
        
        println("Share button pressed")
        
//        let textToShare = "With a yearly compound interest rate of \(floor(rateSlider.value*10)/10)%, it will take \(round((log(floor(gainSlider.value*10)/10)/log(1+(floor(rateSlider.value*10)/10)/100))*100)/100) years for an investment to increase \(floor(gainSlider.value*10)/10)x! Download 'The Rule of 72' App at tinyurl.com/qcbkwa2 now"
        
        let textToShare = "It would take \(round((log(floor(gainSlider.value*10)/10)/log(1+(floor(rateSlider.value*10)/10)/100))*100)/100) years for an investment to increase \(floor(gainSlider.value*10)/10)x with a yearly interest rate of \(floor(rateSlider.value*10)/10)%. Download 'The Rule of 72' now at tinyurl.com/qcbkwa2"
        
        if let myWebsite = NSURL(string: "tinyurl.com/qcbkwa2")
            
            
        {
            let objectsToShare = [textToShare]//, bookTitleTextToShare, myWebsite, /*img*/]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            //New Excluded Activities Code
            activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
            //
            
            //if iPhone
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone) {
                println("iPhone detected")
                self.presentViewController(activityVC, animated: true, completion: nil)
            } else { //if iPad
                // Change Rect to position Popover
                println("iPad detected")
                var popoverCntlr = UIPopoverController(contentViewController: activityVC)
                popoverCntlr.presentPopoverFromRect(CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 0, 0), inView: self.view, permittedArrowDirections: nil/*UIPopoverArrowDirection.nil*/, animated: true)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.scrollRangeToVisible(NSMakeRange(0, 0))
        
        rateSlider.minimumTrackTintColor = UIColor.greenColor()
        rateSlider.maximumTrackTintColor = UIColor.redColor()
        
        gainSlider.minimumTrackTintColor = UIColor.greenColor()
        gainSlider.maximumTrackTintColor = UIColor.redColor()
        
        rateLabel.text = "\(rateSlider.value)%"
        gainLabel.text = "\(gainSlider.value)x"
        
        resultLabel.text = "Time for investment to increase \(gainSlider.value)x:"
        results2Label.text = "\(log(gainSlider.value)/log(1+rateSlider.value/100)) years"
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
