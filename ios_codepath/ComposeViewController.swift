//
//  ComposeViewController.swift
//  ios_codepath
//
//  Created by Jules Walter on 8/11/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController{

    @IBOutlet weak var faceImageView: UIImageView!
    @IBOutlet weak var wasThereButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var composeField: UITextField!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var wasThereBottomMargin: NSLayoutConstraint!
    @IBOutlet weak var submitBottomMargin: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        composeField.becomeFirstResponder()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        closeButton.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func screenTwo(){
        faceImageView.alpha = 0
        closeButton.alpha = 1
    }
    

    func keyboardWillShow(notification: NSNotification!){
        var userInfo = notification.userInfo!
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            self.wasThereBottomMargin.constant = kbSize.height
            self.submitBottomMargin.constant = kbSize.height
            
            }, completion: nil)
    }

    func keyboardWillHide(notification: NSNotification!){
        var userInfo = notification.userInfo!
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            self.wasThereBottomMargin.constant = 0
            self.submitBottomMargin.constant = 0
            
            }, completion: nil)
    }
    
    @IBAction func didPressClose(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func didPressWasThere(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func didPressSubmit(sender: UIButton) {
        
        
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
