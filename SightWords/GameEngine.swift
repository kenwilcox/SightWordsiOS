//
//  GameEngine.swift
//  SightWords
//
//  Created by Kenneth Wilcox on 9/12/15.
//  Copyright © 2015 Kenneth Wilcox. All rights reserved.
//

import Foundation

class GameEngine {
  private var wordItemList: [WordItem] = []
  private var currentPos = 0
  
  init() {
    if let path = NSBundle.mainBundle().pathForResource("words", ofType: "json") {
      do {
        let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
        let jsonResult: NSArray = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSArray
        
        for item in jsonResult {
          let wordItem = WordItem(word: item["word"] as! String, hint: item["hint"] as! String)
          wordItemList.append(wordItem)
        }
        
        wordItemList.shuffleInPlace()
        print(wordItemList.count)
        currentPos = 0
        
      } catch let error as NSError {
        print(error.localizedDescription)
      }
    }
  }
  
  func getNextWordItem() -> WordItem {
    let item = wordItemList[currentPos]
    if currentPos < wordItemList.count {
      currentPos += 1
    } else {
      currentPos = 0
    }
    return item
  }
  
  func getStatusText() -> String {
    return "Word \(currentPos) of \(wordItemList.count)"
  }
}