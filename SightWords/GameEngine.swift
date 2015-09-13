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
  // TODO: Might be easier to just copy the array to a new one and pop items off the top
  private var currentPos = -1
  
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
        currentPos = -1
        
      } catch let error as NSError {
        print(error.localizedDescription)
      }
    }
  }
  
  func getNextWordItem() -> WordItem {
    currentPos += 1
    if currentPos >= wordItemList.count {
      currentPos = 0
    }
    return wordItemList[currentPos]
  }
  
  func getStatusText() -> String {
    return "Word \(currentPos + 1) of \(wordItemList.count)"
  }
  
  func buildCommandList() {
    for item in wordItemList {
      print("say \(item.word) -o \(item.word)")
    }
  }
}