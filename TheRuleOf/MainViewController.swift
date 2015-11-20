//
//  MainViewController.swift
//  TheRuleOf
//
//  Created by Ryan Vanderhoef on 8/7/15.
//  Copyright (c) 2015 Ryan Vanderhoef. All rights reserved.
//

import UIKit
import Darwin

class MainViewController: UIViewController {
    
    @IBOutlet weak var slide: UISlider!
    @IBAction func sliderSlid(sender: AnyObject) {
        label.text = "\(floor(slide.value*10)/10)%"
        resultLabel.text = "Time to double investment: \(round((72/(floor(slide.value*10)/10))*100)/100) years"
        exactLabel.text = "Time to double investment: \(round((log(2)/log(1+(floor(slide.value*10)/10)/100)))*100)/100) years"
        log(2)/log(1+(floor(slide.value*10)/10)/100)
    }
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var exactLabel: UILabel!
    
    @IBAction func buttonpress(sender: AnyObject) {
        
        slide.setValue(6.0, animated: true)
        
        label.text = "\(floor(slide.value*10)/10)%"
        resultLabel.text = "Time to double investment: \((72/(floor(slide.value*10)/10))) years"
        exactLabel.text = "Time to double investment: \(log(2)/log(1+(floor(slide.value*10)/10)/100)) years"
    }
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func shareButton(sender: AnyObject) {
        
//        let textToShare = "With a yearly compound interest rate of \(slide.value)%, it will take approximately \(72/slide.value) years for an investment to double according to The Rule of 72!\n\nDownload 'The Rule of 72' from the App Store now."
//        let objectsToShare = [textToShare]
//        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
//        activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
//        self.presentViewController(activityVC, animated: true, completion: nil)
        println("Share button pressed")
        
//        let textToShare = "With a yearly compound interest rate of \(floor(slide.value*10)/10)%, it will take \(round((log(2)/log(1+(floor(slide.value*10)/10)/100))*100)/100) years for an investment to double according to 'The Rule of 72' App! Download at tinyurl.com/qcbkwa2 now"
        
        let textToShare = "It would take \(round((log(2)/log(1+(floor(slide.value*10)/10)/100))*100)/100) years for an investment to double with a yearly complound interest rate of \(floor(slide.value*10)/10)%. Download 'The Rule of 72' now at tinyurl.com/qcbkwa2"
        
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
        
        label.layer.cornerRadius = 5
        slide.minimumTrackTintColor = UIColor.greenColor()
        slide.maximumTrackTintColor = UIColor.redColor()
        
        label.text = "\(slide.value)%"
        resultLabel.text = "Time to double investment: \(72/slide.value) years"
        exactLabel.text = "Time to double investment: \(log(2)/log(1+slide.value/100)) years"
        
        
        
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
