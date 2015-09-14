//
//  ViewController.swift
//  SightWords
//
//  Created by Kenneth Wilcox on 9/9/15.
//  Copyright © 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  private let game = GameEngine()
  private var item: WordItem?
  private var hintSound: AVAudioPlayer!
  
  @IBOutlet weak var wordLabel: UILabel!
  @IBOutlet weak var hintButton: UIButton!
  @IBOutlet weak var nextButton: UIButton!
  @IBOutlet weak var stepLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    hintButton.hidden = true;
    nextButton.setTitle("YES!", forState: .Normal)
    //game.buildCommandList()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func hintButtonPressed(sender: UIButton) {
    hintButton.enabled = false
    //print(item!.hint)
    hintSound = setupAudioPlayerWithFile(item!.hint, type: item!.type)
    hintSound.play()
    hintButton.enabled = true
  }

  @IBAction func nextButtonPressed(sender: UIButton) {
    item = game.getNextWordItem()
    //print(game.getStatusText())
    stepLabel.text = game.getStatusText()
    wordLabel.text = item!.word
    
    // just do this once
    nextButton.setTitle("Next >>", forState: .Normal)
    hintButton.hidden = false
    //wordLabel.font = UIFont.systemFontOfSize(82.0)
  }
  
  func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer  {
    let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
    let url = NSURL.fileURLWithPath(path!)
    var audioPlayer:AVAudioPlayer?
    
    do {
      try audioPlayer = AVAudioPlayer(contentsOfURL: url)
    } catch {
      print("NO AUDIO PLAYER")
    }
    
    return audioPlayer!
  }
}

