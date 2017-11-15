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
    if let path = Bundle.main.path(forResource: "words", ofType: "json") {
      do {
        let data = try NSData(contentsOf: NSURL(fileURLWithPath: path) as URL, options: NSData.ReadingOptions.mappedIfSafe)
        let jsonResult: NSArray = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        
        for item in jsonResult {
          let dic = item as! NSDictionary
          let wordItem = WordItem(
            word: dic["word"] as! String,
            hint: dic["hint"] as! String,
            type: dic["type"] as! String,
            set: dic["set"] as! Int
          )
          wordItemList.append(wordItem)
        }
        
        wordItemList.shuffle()
        wordItemList = wordItemList.filter{$0.set == 3}
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
    // ugh, I don't like magic numbers
    if (currentPos == -1) {return "\(wordItemList.count) words"}
    return "Word \(currentPos + 1) of \(wordItemList.count)"
  }
  
  func buildCommandList() {
    for item in wordItemList {
      print("say \(item.word) -o \(item.word)")
    }
  }
}
