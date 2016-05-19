//
//  ViewController.swift
//  Retro Calculator
//
//  Created by AADITYA NARVEKAR on 5/16/16.
//  Copyright © 2016 Aaditya Narvekar. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var answerLabel: UILabel!
    var btnSound: AVAudioPlayer!
    var num: Double = 0
    var result: Double = 0.0
    
    var performAddition: Bool = false
    var performSubtraction: Bool = false
    var performMultiplication: Bool = false
    var performDivision: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        let audioFilePath = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let audioFileURL = NSURL.fileURLWithPath(audioFilePath!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: audioFileURL)
        } catch let error as NSError {
            print(error.description)
        }
        
        btnSound.prepareToPlay()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numberPressed(btn: UIButton) {
        btnSound.play()
        
        if btn.tag < 10 {
            num = num * 10 + Double(btn.tag)
            answerLabel.text = String(num)
        }
        
        if btn.tag == 10 { // Addition
            updateResult()
            performAddition = true
            answerLabel.text = String(result)
        }
        
        if btn.tag == 11 { // Subtraction
            updateResult()
            performSubtraction = true
            answerLabel.text = String(result)
        }
        
        if btn.tag == 12 { // Multiplication
            updateResult()
            performMultiplication = true
            answerLabel.text = String(result)
        }
        
        if btn.tag == 13 { // Division
            updateResult()
            performDivision = true
            answerLabel.text = String(result)
        }
        
        if btn.tag == 14 { // Equals
            updateResult()
            answerLabel.text = String(result)
        }
        
    }

    @IBAction func resetCalculator(sender: UIButton) {
        result = 0
        num = 0
        answerLabel.text = "0.0"
    }
    
    func updateResult() {
        if performAddition {
            result = result + Double(num)
            num = 0
            performAddition = false
        } else if performSubtraction {
            result = result - Double(num)
            num = 0
            performSubtraction = false
        } else if performMultiplication {
            result = result * Double(num)
            num = 0
            performMultiplication = false
        } else if performDivision {
            result = result / Double(num)
            num = 0
            performDivision = false
        } else {
            result = Double(answerLabel.text!)!
            num = 0
        }
    }

}

