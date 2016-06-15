//
//  FifthViewController.swift
//  Pinterest
//
//  Created by Mikkel Jensen on 10/06/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit
import Firebase


class GoogleSignInViewController: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = GIDSignIn.sharedInstance().uiDelegate
        
        // Uncomment to automatically sign in the user.
        GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }
        class GoogleSignInViewController: UIViewController, GIDSignInUIDelegate {
            // ...
            
        }
      
        // Do any additional setup after loading the view.
    }

    func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
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


