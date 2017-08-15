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
    
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func recordSound(_ sender: Any) {
        tapLabel.text = "Recording.."
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        tapLabel.text = "Tap to record"
    }

}

