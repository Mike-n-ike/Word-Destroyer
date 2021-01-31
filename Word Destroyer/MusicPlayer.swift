//
//  MusicPlayer.swift
//  Word Destroyer
//
//  Created by Michael Lu on 2021-01-31.
//  Copyright © 2021 NextGenApps. All rights reserved.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            //audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("ERROR")
        }
    }
}

/*
class MusicPlayer {
    static let shared = MusicPlayer()
    

    func startBackgroundMusic(backgroundMusicFileName: String) {
        if let bundle = Bundle.main.path(forResource: backgroundMusicFileName, ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
}

 */
