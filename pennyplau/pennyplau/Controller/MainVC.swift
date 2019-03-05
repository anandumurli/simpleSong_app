//
//  ViewController.swift
//  pennyplau
//
//  Created by anandu on 05/03/19.
//  Copyright © 2019 Emilda pvt. ltd. All rights reserved.
//

import UIKit
import MediaPlayer

class MainVC: UIViewController {
   @IBOutlet weak var playbut: UIButton!
    var Player: player!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        Player = player()
        let url = "http://horrifying-plates.000webhostapp.com/Music_app/ACDC_TNT.mp3"
        Player.stream(fileURL: url)
        
    }
    @IBAction func playpausebut(sender: AnyObject){
        if (Player.avPlayer.rate > 0){
            Player.pauseAudio()
            playbut.setTitle("Play", for: .normal)
        } else {
            Player.playAudio()
            playbut.setTitle("Pause", for: .normal)
        }
    }

}

