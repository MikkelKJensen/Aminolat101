//
//  FifthViewController.swift
//  Pinterest
//
//  Created by Mikkel Jensen on 10/06/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//



import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseAuth





class GoogleSignInViewController: UIViewController, FBSDKLoginButtonDelegate { //GIDSignInUIDelegate  {
    
     var loginButton: FBSDKLoginButton = FBSDKLoginButton()
    
    

    @IBOutlet var username: UITextField!
    
    
    @IBOutlet var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
        
        
        self.loginButton.hidden = false
        
        
        FIRAuth.auth()?.addAuthStateDidChangeListener { auth, user in
            if let user = user {
                // User is signed in.
                // Re-direct to another ViewController
                
                //let mainStoryboard: UIStoryboard =  UIStoryboard(name: "Main", bundle: nil)
                //let UITabBarController: UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("HomeView")
                
                
                //self.presentViewController(UITabBarController, animated: true, completion: nil)
                
                self.loginButton.center = self.view.center
                self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
                self.loginButton.delegate = self;
                self.view!.addSubview(self.loginButton)
                
                self.loginButton.hidden = false
                
            } else {
                // No user is signed in.
                // Show the user the login button
                
                
                // Optional: Place the button in the center of your view.
                self.loginButton.center = self.view.center
                self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
                self.loginButton.delegate = self;
                self.view!.addSubview(self.loginButton)
                
                self.loginButton.hidden = false
            }
        }
        
        
        

    }
    
//        class GoogleSignInViewController: UIViewController, GIDSignInUIDelegate {
            // ...

//        }

        // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        print("User logged in")
        
        
        

////////////////////////////////////////CREATES ERROR IF UNCOMMENT: FIREBASE////////////////////////////////////////////////////
        let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)

        FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
         
            print("User logged in to Firebase")
        }
///////////////////////////////////////CREATES ERROR IF UNCOMMENT: FIREBASE////////////////////////////////////////////////////
        
        
        
        
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User did log out")
        
        
    }
    
/*
    
    @IBAction func createAccount(sender: AnyObject) {
        

        FIRAuth.auth()?.createUserWithEmail(username.text!, password: password.text!, completion: { user, error in
            if error != nil {

            self.login()
            
            } else {
            
            print("User Created")
            self.login()
            
            }
        })
    }

    func login(){
        
        FIRAuth.auth()?.signInWithEmail(username.text!, password: password.text!, completion: {
           
            user, error in
            
            if error != nil {
                
                print("Incorrect")
                
            } else {
                
                
                print("Yaaaaaayh")
            }
            
            
        })
        
    }
*/
}
    
/*
    @IBAction func facebookLogin (sender: AnyObject){
        
                let dataURL = "https://burning-torch-4563.firebaseio.com"
        let myRootRef = Firebase(url: dataURL)
                                //FIRAuth(url: )
                                //Firebase(url: dataURL)
        

        let facebookLogin = FBSDKLoginManager()
        print("Logging In")
        
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self, handler:{(facebookResult, facebookError) -> Void in
            if facebookError != nil { print("Facebook login failed. Error \(facebookError)")
            } else if facebookResult.isCancelled { print("Facebook login was cancelled.")
            } else { print("You’re inz ;)")
            }
        
        
        let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
        
        myRootRef.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { error, authData in
            
            if error != nil {
                print("Login failed. Error \(facebookError)")
            } else {
                print("Logged in \(authData)")
                
                
                let newUser = [
                    "provider": authData.providerData["displayName"] as? NSString as? String,
                    "email" : authData.providerData["email"] as? NSString as? String
                ]
                
             myRootRef.childByAppendingPath("users").childByAppendingPath(authData.uid).setValue(newUser)
                
                let nextView = (self.storyboard?.instantiateViewControllerWithIdentifier("NumberPad"))! as UIViewController
                self.presentViewController(nextView, animated: true, completion: nil)
                
            }
*/
//        });
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
