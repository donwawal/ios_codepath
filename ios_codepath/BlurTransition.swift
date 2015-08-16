//
//  EditProfileTransition.swift
//  ios_codepath
//
//  Created by Jules Walter on 8/9/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BlurTransition: BaseTransition {
    
    var blurView: UIVisualEffectView!
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let blurEffect = UIBlurEffect(style: .Dark)
        
        blurView = UIVisualEffectView(effect: blurEffect)
        var view = toViewController.view
        blurView.frame = view.frame
        view.insertSubview(blurView, atIndex: 0)
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            //
        }) { (Bool) -> Void in
            self.finish()
        }
    }
    
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        blurView.removeFromSuperview()
    
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            //
            }) { (Bool) -> Void in
            self.finish()
        }
        
    }
   
}
