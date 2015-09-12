//
//  ViewController.swift
//  SightWords
//
//  Created by Kenneth Wilcox on 9/9/15.
//  Copyright © 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  private let game = GameEngine()
  private var item: WordItem?
  
  @IBOutlet weak var wordLabel: UILabel!
  @IBOutlet weak var hintButton: UIButton!
  @IBOutlet weak var nextButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    hintButton.hidden = true;
    nextButton.setTitle("YES!", forState: .Normal)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func hintButtonPressed(sender: UIButton) {
    print(item!.hint)
  }

  @IBAction func nextButtonPressed(sender: UIButton) {
    item = game.getNextWordItem()
    print(game.getStatusText())
    wordLabel.text = item!.word
  }
}

