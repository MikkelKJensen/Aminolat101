//
//  ViewController.swift
//  Pinterest
//
//  Created by Mikkel Jensen on 08/06/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//


import UIKit
import Firebase

class ViewController: UIViewController, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
  
  
  
  var searchController : UISearchController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.searchController = UISearchController(searchResultsController:  nil)
    
    self.searchController.searchResultsUpdater = self
    self.searchController.delegate = self
    self.searchController.searchBar.delegate = self
    
    self.searchController.hidesNavigationBarDuringPresentation = false
    self.searchController.dimsBackgroundDuringPresentation = true
    
    self.navigationItem.titleView = searchController.searchBar
    
    self.definesPresentationContext = true
  }
  
  func updateSearchResultsForSearchController(searchController: UISearchController) {
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func setStatusBarBackgroundColor(color: UIColor) {
    
    guard  let statusBar = UIApplication.sharedApplication().valueForKey("statusBarWindow")?.valueForKey("statusBar") as? UIView else {
      return
      
    }
    
    statusBar.backgroundColor = UIColor.blueColor()
  }
}


/*
  //Changing Status Bar
   func preferredStatusBarStyle() -> UIStatusBarStyle {
    
    //LightContent
    return UIStatusBarStyle.LightContent
    
    //Default
    //return UIStatusBarStyle.Default
    
  }
*/  
