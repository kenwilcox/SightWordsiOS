//
//  GameEngine.swift
//  SightWords
//
//  Created by Kenneth Wilcox on 9/12/15.
//  Copyright © 2015 Kenneth Wilcox. All rights reserved.
//

import Foundation

class GameEngine {
  init() {
    if let path = NSBundle.mainBundle().pathForResource("words", ofType: "json") {
      do {
        let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
        let jsonResult: NSArray = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSArray
        
        print(jsonResult[0]["word"] as! String)
      } catch let error as NSError {
        print(error.localizedDescription)
      }
    }
  }
  
  func doSomething() {
    print("I hate lame warnings")
  }
}