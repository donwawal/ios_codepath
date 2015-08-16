//
//  ClassOverviewViewController.swift
//  ios_codepath
//
//  Created by Jules Walter on 8/10/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class ClassOverviewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("ClassOverviewCell") as! ClassOverviewCell
        
        cell.nameLabel.text = "iOS for Designers"
        cell.tagLineLabel.text = "Learn the Swift basics to prototype in code"
        cell.monthLabel.text = "Sept"
        cell.dayLabel.text = "14"
        cell.bodyLabel.text = "This bootcamp empowers designers to modify the view and animation related code for iOS Swift prototypes as well as production apps. There is a focus on views, navigation, transitions, and animations. It omits advanced topics, such as networking, threading, models, and device frameworks for accessing the camera and location."
        cell.numSessionsLabel.text = "8"
        cell.sessionLengthLabel.text = "2 hour sessions"
        cell.weekdaysLabel.text = "Mondays and Wednesdays"
        cell.priceLabel.text = "Free of Charge"
        cell.locationLabel.text = "At Uber HQ"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }

    @IBAction func didPressClose(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didPressApply(sender: UIButton) {
        let url = NSURL(string: "https://google.com")!
        UIApplication.sharedApplication().openURL(url)
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
