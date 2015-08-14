//
//  DialogueViewController.swift
//  ios_codepath
//
//  Created by Jules Walter on 8/11/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class DialogueViewController: UIViewController {
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var faceImageView: UIImageView!
    @IBOutlet weak var dialogueLabel: UILabel!
    var letsCheckYouIn: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if letsCheckYouIn == nil {
            letsCheckYouIn = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressYes(sender: UIButton) {
        if (letsCheckYouIn == true){
            //TODO checkin code
        } else {
            letsCheckYouIn = true
            showScreenTwo()
        }
    }
    
    func showScreenTwo(){
        noButton.setTitle("WAIT, NO I WASN'T", forState: .Normal)
        yesButton.setTitle("COOL", forState: .Normal)
        faceImageView.image = UIImage(named: "happy_face")
        dialogueLabel.text = "Alright, we’ll check you in!"
    }
    
    @IBAction func didPressNo(sender: UIButton) {
        performSegueWithIdentifier("ComposeSegue", sender: nil)
    }
    
    
}
