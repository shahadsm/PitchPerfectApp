//
//  playSoundsViewController.swift
//  PitchPerfect2
//
//  Created by shahad almugrin on 9/17/19.
//  Copyright © 2019 shahad almugrin. All rights reserved.
//

import UIKit
import AVFoundation

class playSoundsViewController: UIViewController {
    
    @IBOutlet weak var SlowButton: UIButton!
    @IBOutlet weak var FastButton: UIButton!
    @IBOutlet weak var HighPitchButton: UIButton!
    @IBOutlet weak var LowPitchButton: UIButton!
    @IBOutlet weak var ReverbButton: UIButton!
    @IBOutlet weak var EchoButton: UIButton!
    @IBOutlet weak var Stoputton: UIButton!
    
    
    var recordAudioURL: URL!
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPreessed(_sender: AnyObject){
       stopAudio()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           stopAudio()
       }
    
}
