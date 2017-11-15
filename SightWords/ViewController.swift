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
    hintButton.isHidden = true;
    nextButton.setTitle("YES!", for: [])
    stepLabel.text = game.getStatusText()
    //game.buildCommandList()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func hintButtonPressed(sender: UIButton) {
    hintButton.isEnabled = false
    //print(item!.hint)
    hintSound = setupAudioPlayerWithFile(file: item!.hint, type: item!.type)
    hintSound.play()
    hintButton.isEnabled = true
  }

  @IBAction func nextButtonPressed(sender: UIButton) {
    item = game.getNextWordItem()
    //print(game.getStatusText())
    stepLabel.text = game.getStatusText()
    wordLabel.text = item!.word
    
    // just do this once
    nextButton.setTitle("Next >>", for: [])
    hintButton.isHidden = false
    //wordLabel.font = UIFont.systemFontOfSize(82.0)
  }
  
  func setupAudioPlayerWithFile(file:String, type:String) -> AVAudioPlayer  {
    let path = Bundle.main.path(forResource: file as String, ofType: type as String)
    let url = NSURL.fileURL(withPath: path!)
    var audioPlayer:AVAudioPlayer?
    
    do {
      try audioPlayer = AVAudioPlayer(contentsOf: url)
    } catch {
      print("NO AUDIO PLAYER")
    }
    
    return audioPlayer!
  }
}

