//
//  RecordSoundViewController.swift
//  PitchMe
//
//  Created by Chiranth Bangalore Sathyaprakash on 8/14/17.
//  Copyright © 2017 Chiranth Bangalore Sathyaprakash. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {

    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var tapLabel: UILabel!
    
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    func configureUI(appState: Bool) {
        if appState {
            tapLabel.text = "Recording in Progress"
            stopButton.isEnabled = true
            recordButton.isEnabled = false
        } else {
            tapLabel.text = "Tap to Record"
            recordButton.isEnabled = true
            stopButton.isEnabled = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stopButton.isEnabled = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func recordSound(_ sender: Any) {
        tapLabel.text = "Recording.."
        
       // stopButton.isEnabled = true
        //recordButton.isEnabled = false
        configureUI(appState: true)
        
        //record Audio logic
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self //set delegate
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(_ sender: Any) {

        configureUI(appState: false)
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("cld??")
        //called once recording is finished
        if flag {
            print("audio stopped recording")
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        }else {
            print("error recording messages")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "stopRecording") {
            let playSoundVC = segue.destination as! PlaySoundViewController
            let recordedUrl = sender as! URL
            playSoundVC.recordedAudioURL = recordedUrl
        }
    }

}

