//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by AJ Webb on 3/17/15.
//  Copyright (c) 2015 AJ Webb. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //create the audio player, give it the file path and enable rate changes
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        
        //create the engine and file
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playSoundSlowly(sender: UIButton) {
        //Play audio slooooowly here....
        playAudioWithVariableSpeed(0.5)
    }
    
    @IBAction func playSoundFast(sender: UIButton) {
        //Play audio fast here...
        playAudioWithVariableSpeed(2.0)
    }
    
    func playAudioWithVariableSpeed(speed: Float) {
        //stop and reset the audio player and engine
        audioPlayer.stop()
        audioEngine.reset()
        audioPlayer.currentTime = 0.0
        
        //set the speed of the audio
        audioPlayer.rate = speed
        
        // play the audio
        audioPlayer.play()
    }
    
    func playAudioWithVariablePitch(pitch: Float) {
        //stop and reset the audio player and engine
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        //create the player node and attach it to the engine
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        //create the ability to change pitch and attach it to the engine
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        // connect the player to the pitch change and the pitch change to the speakers
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        //point to the recorded audio file
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        // play the audio
        audioPlayerNode.play()
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        // play the audio very high
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playVaderAudio(sender: UIButton) {
        // play the audio very low
        playAudioWithVariablePitch(-1000)
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        //Stop the audio
        audioPlayer.stop()
        audioEngine.stop()
    }
}
