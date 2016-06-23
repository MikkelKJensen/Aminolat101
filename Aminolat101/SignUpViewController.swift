//
//  SignUpViewController.swift
//  Aminolat101
//
//  Created by Mikkel Jensen on 19/06/16.
//  Copyright © 2016 Mikkel Jensen. All rights reserved.
//

import Foundation
import Firebase


class SignUpViewController: UIViewController {
    
   
    @IBOutlet var Email: UITextField!
    
    
    @IBOutlet var Password: UITextField!
    
    
    @IBAction func Create(sender: AnyObject) {
        
        
        let email = self.Email.text!
        let password = self.Password.text!
        
        //Makes sure the user entered both email and password
        
        if email != "" && password != "" {
            
            FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (user, error) -> Void in
                
                if error == nil {
                    
                    FIREmailPasswordAuthProvider.credentialWithEmail(email, password: password)
                    
                    self.dismissViewControllerAnimated(true, completion: nil)
                    
                } else {
                    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    ///////////////////////////////// : FIND UD AT HVORDAN MAN FÅR EN POP-UP BOKS, SOM VISER EN FEJL TIL BRUGEREN
                    print("error")
                }
            })
        } else {
            
            let alert = UIAlertController(title: "Error", message: "Please enter you email and password", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func Cancel(sender: AnyObject) {
     
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}