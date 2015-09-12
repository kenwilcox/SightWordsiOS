//
//  ViewController.swift
//  SightWords
//
//  Created by Kenneth Wilcox on 9/9/15.
//  Copyright © 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var wordLabel: UILabel!
  @IBOutlet weak var hintButton: UIButton!
  @IBOutlet weak var nextButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    var gc = GameEngine()
    gc.doSomething()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func hintButtonPressed(sender: UIButton) {
    
  }

  @IBAction func nextButtonPressed(sender: UIButton) {
    
  }
}

