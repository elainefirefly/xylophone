//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        let fileName = "note" + String(sender.tag)
        let ext = ".wav"
        playSound(filename: fileName, ext: ext)
    }
    
    func playSound(filename: String, ext: String) {
        if let soundURL = Bundle.main.url(forResource: filename, withExtension: ext) {
            
            var soundId: SystemSoundID = 0
        
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundId)
            AudioServicesAddSystemSoundCompletion(soundId, nil, nil, { (soundId, clientData) -> Void in
                AudioServicesDisposeSystemSoundID(soundId)
            }, nil)
        
            AudioServicesPlaySystemSound(soundId)
        }
    }

}

