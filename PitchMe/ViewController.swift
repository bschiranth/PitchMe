//
//  ViewController.swift
//  PitchMe
//
//  Created by Chiranth Bangalore Sathyaprakash on 8/14/17.
//  Copyright © 2017 Chiranth Bangalore Sathyaprakash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tapLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func recordSound(_ sender: Any) {
        tapLabel.text = "Recording.."
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        tapLabel.text = "Tap to record"
    }

}

