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

    var audioPlayer:AVAudioPlayer!
    var pitchPlayer:AVAudioUnitTimePitch!
    var receivedAudio:RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
//            var fileUrl = NSURL.fileURLWithPath(filePath)
//        } else {
//            println("The filePath is empty")
//        }
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playSoundSlowly(sender: UIButton) {
        //Play audio slooooowly here....
        audioPlayer.rate = 0.5
        playAudio()
    }
    
    @IBAction func playSoundFast(sender: UIButton) {
        //Play audio fast here...
        audioPlayer.rate = 2.0
        playAudio()
    }
    
    func playAudio() {
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        //Stop the audio
        audioPlayer.stop()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
