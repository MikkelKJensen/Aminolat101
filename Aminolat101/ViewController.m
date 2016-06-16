//
//  ViewController.m
//  CollectionViewWithSearchBar
//
//  Created by Bean Bob on 5/29/15.
//  Copyright (c) 2015 Bean Bob. All rights reserved.
//

#import "ViewController.h"
@import Firebase;
@import FirebaseAuth;
@import GoogleSignIn;



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [GIDSignIn sharedInstance].clientID = [FIRApp defaultApp].options.clientID;
    [GIDSignIn sharedInstance].delegate = self;
    [GIDSignIn sharedInstance].uiDelegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)signIn:(GIDSignIn *) signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    
    if (user) {
        NSString * welcomeMessage = [NSString stringWithFormat: @"Welcome To FireBase, %@"];
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Firebase" message:welcomeMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    } else {
        
        NSLog(@"%@", error.localizedDescription);
    }
    
    }
    
-(IBAction)SignOutClicked:(id)sender {
    
    FIRAuth *firebaseAuth = [FIRAuth auth];
    NSError * signOutError;
    BOOL status = [firebaseAuth signOut:&signOutError];
    if (!status) {
        NSLog(@"Error Signing Out: %@", signOutError);
        return;
    }
    
//    _signInButton.enabled = true;
//    _signOutButton.enabled = false;

}


@end
