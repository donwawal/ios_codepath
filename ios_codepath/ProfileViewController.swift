//
//  ProfileViewController.swift
//  codepath_app
//
//  Created by Jules Walter on 8/1/15.
//  Copyright (c) 2015 Jules Walter. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var user: User!
    var rows: Int!
    var courses: [Course]!
    
    var fullname: String!
    var company: String!
    var email: String!
    var github: String!

    var transition: BlurTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        user = User()
        
        //Parse
        rows = 2
        fullname = "Kristina Varshavskaya"
        company = "Facebook"
        email = "kristina@fb.com"
        github = "@kristinavars"
        
        //Profile image
        var frame = CGRectMake(0, 0, self.view.frame.size.width, 200)
        var headerImageView = UIImageView(frame: frame)
        var image: UIImage = UIImage(named: "profile_photo")!
        headerImageView.image = image
        tableView.tableHeaderView = headerImageView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressSettings(sender: UIButton) {
        
        let settingsMenu = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        let editProfileAction = UIAlertAction(title: "Edit Profile", style: .Default) { (alert: UIAlertAction!) -> Void in
            //present edit profile screen
            self.performSegueWithIdentifier("editProfileSegue", sender: nil)
        }
        
        let signOutAction = UIAlertAction(title: "Sign Out", style: .Default) { (alert: UIAlertAction!) -> Void in
            // TODO
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (alert: UIAlertAction!) -> Void in
            //TODO
        }
        
        settingsMenu.addAction(editProfileAction)
        settingsMenu.addAction(signOutAction)
        settingsMenu.addAction(cancelAction)
        
        self.presentViewController(settingsMenu, animated: true, completion: nil)
    }
    
    @IBAction func didPressClose(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 190
        }
        else {
            return 92
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        else {
            return rows
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        }
        else {
            return "Achievements"
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        switch(section){
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("ContactInfoCell") as! ContactInfoCell
            cell.fullNameLabel.text = fullname
            cell.companyLabel.text = company
            cell.githubLabel.text = email
            cell.emailLabel.text = github
            return cell
            
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("CourseCell") as! CourseCell
//            let course = courses[indexPath.row]
            
            cell.badgeImageView.image = UIImage(named: "class_icon")
            cell.courseTitleLabel.text = "iOS for Designers"
            cell.currentWeekLabel.text = "2"
            cell.maxWeekLabel.text = "8"
            
//            cell.badgeImageView.image = TBD
//            cell.courseTitleLabel.text = course.name
//            cell.currentWeekLabel.text = TBD
//            cell.maxWeekLabel.text = String(course.numSessions)
            
            return cell
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "editProfileSegue" {
            var editProfileViewController = segue.destinationViewController as! EditProfileViewController
            
            editProfileViewController.user = user

            editProfileViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
            transition = BlurTransition()
            editProfileViewController.transitioningDelegate  = transition
        }
    }
}
