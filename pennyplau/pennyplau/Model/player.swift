//
//  player.swift
//  pennyplau
//
//  Created by Anandu on 05/03/19.
//  Copyright © 2019 Emilda pvt. ltd. All rights reserved.
//

import Foundation
import MediaPlayer

class player{
    private(set) public var avPlayer: AVPlayer!
    
    init(){
        avPlayer = AVPlayer()
    }
    func stream (fileURL: String){
        let url = NSURL(string: fileURL)
        avPlayer = AVPlayer(url: url! as URL)
       // setplayingScreen(fileUrl: fileURL)
        //avPlayer.play()
    }
    func playAudio(){
        if(avPlayer.rate == 0 && avPlayer.error == nil){
            avPlayer.play()
        }
    }
    func pauseAudio(){
        if(avPlayer.rate > 0 && avPlayer.error == nil){
            avPlayer.pause()
        }
    }
  /*  func setplayingScreen(fileUrl: String){
        let urlArr = fileUrl.components(separatedBy: "/")
        let name = urlArr[urlArr.endIndex-1]
        print(name)
        let songInfo = [MPMediaItemPropertyTitle: name,
                        MPMediaItemPropertyArtist: "Penny plu"]
        MPNowPlayingInfoCenter.default().nowPlayingInfo = songInfo
    }*/
}
