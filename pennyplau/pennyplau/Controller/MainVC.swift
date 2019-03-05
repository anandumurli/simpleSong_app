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
        setSessions()
        UIApplication.shared.beginReceivingRemoteControlEvents()
        becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector: #selector(handleInterruption), name: NSNotification.Name(rawValue: ".AVAudioSession.interruptionNotification"), object: nil)
        
        Player = player()
        let url = "http://horrifying-plates.000webhostapp.com/Music_app/ACDC_Thunderstruck.mp3"
        Player.stream(fileURL: url)
        
    }
   @objc func handleInterruption(notification: Notification){
        Player.pauseAudio()
        let interuptionTypeAsObject = notification.userInfo![AVAudioSessionInterruptionTypeKey] as! NSNumber
        let interruptionType = AVAudioSession.InterruptionType(rawValue: interuptionTypeAsObject.uintValue)
        if let type = interruptionType{
            if type == .ended{
                Player.playAudio()
            }
        }
    }
    override var canBecomeFirstResponder: Bool {
    
        return true
    }
    override func remoteControlReceived(with event: UIEvent?) {
        
        if event!.subtype == UIEvent.EventSubtype.remoteControlPause{
            print("pause")
            Player.pauseAudio()
        }else if event!.subtype == UIEvent.EventSubtype.remoteControlPlay{
            print("playing")
            Player.playAudio()
        }
    }
    func setSessions(){
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error)
        }
        
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
    
    /*func retriveSongs(){
        let task = URLSession.shared.dataTask(with: URLRequest( url: "http://horrifying-plates.000webhostapp.com/Music_app/getMusic.php")){(data,response,error) in
            let retrivedList = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
        }
    }*/

}

