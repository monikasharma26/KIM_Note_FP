//
//  AudioViewController.swift
//  KIM_Note_FP
//
//  Created by user175490 on 6/25/20.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit
import AVFoundation

class AudioViewController: UIViewController {

    @IBOutlet weak var scrubber: UISlider!
    @IBOutlet weak var volume: UISlider!
    @IBOutlet weak var playBtn: UIBarButtonItem!
    
    var isPlaying = false
    
    // we need to create an instance of AVAudioPlayer
    var player = AVAudioPlayer()
    
    // we need to access to the audio file path
    var path = Bundle.main.path(forResource: "bach", ofType: "mp3")
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // add tap gesture to the volume slider
        let gr = UITapGestureRecognizer(target: self, action: #selector(sliderTapped))
        volume.addGestureRecognizer(gr)
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
            scrubber.maximumValue = Float(player.duration)
        } catch {
            print(error)
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            let audioArray = ["boing", "knife", "shoot", "bach", "wah", "explosion", "hit", "swish",
            "warble"]
            
            let randomNumber = Int.random(in: 0..<audioArray.count)
            path = Bundle.main.path(forResource: audioArray[randomNumber], ofType: "mp3")
            
            do {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
                scrubber.maximumValue = Float(player.duration)
            } catch {
                print(error)
            }
        }
    }
    
    @objc func sliderTapped(_ g: UIGestureRecognizer) {
        
        let s: UISlider? = (g.view as? UISlider)
        if (s?.isHighlighted)! {
            return
        }

        // tap on thumb, let slider deal with it
        let pt: CGPoint = g.location(in: s)
        let percentage = pt.x / (s?.bounds.size.width)!
        let delta = Float(percentage) * Float((s?.maximumValue)! - (s?.minimumValue)!)
        let value = (s?.minimumValue)! + delta
        s?.setValue(Float(value), animated: true)
        player.volume = s!.value
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
