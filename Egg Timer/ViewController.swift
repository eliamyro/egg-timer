//
//  ViewController.swift
//  Egg Timer
//
//  Created by Elias Myronidis on 20/4/17.
//  Copyright © 2017 eliamyro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    private var timer = Timer()
    private var defaultTime = 210
    private var currentTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentTime = defaultTime
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pauseBarBtnPressed(_ sender: Any) {
        if timer.isValid {
            timer.invalidate()
        }
    }

    @IBAction func playBarBtnPressed(_ sender: Any) {
        
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimeLabel), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func minTenPressed(_ sender: Any) {
        if currentTime >= 10 {
            currentTime -= 10
            updateTimeLabel()
        }
    }
    
    @IBAction func plusTenPressed(_ sender: Any) {
        currentTime += 10
        updateTimeLabel()
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        currentTime = defaultTime
        updateTimeLabel()
    }
    
   func updateTimeLabel(){
        if currentTime >= 0 {
            currentTime -= 1
            timeLabel.text = String(currentTime)
        } else {
            timer.invalidate()
        }
        
    }
    
}

