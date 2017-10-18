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
            type: dic["type"] as! String
            //word: "word",
            //hint: "where",
            //type: "type"
          )
          wordItemList.append(wordItem)
        }
        
        wordItemList.shuffle()
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
