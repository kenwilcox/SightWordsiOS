//
//  ShuffleExt.swift
//  SightWords
//
//  Created by Kenneth Wilcox on 9/12/15.
//  Copyright © 2015 Kenneth Wilcox. All rights reserved.
//

import Foundation

extension Collection where Index == Int {
  /// Return a copy of `self` with its elements shuffled
  func shuffled() -> [Iterator.Element] {
    var list = Array(self)
    list.shuffle()
    return list
  }
}

extension MutableCollection where Index == Int {
  /// Shuffle the elements of `self` in-place.
  mutating func shuffle() {
    // empty and single-element collections don't shuffle
    if count < 2 { return }
    
    for i in startIndex ..< endIndex - 1 {
      let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
      if i != j {
        self.swapAt(i, j)
      }
    }
  }
}
