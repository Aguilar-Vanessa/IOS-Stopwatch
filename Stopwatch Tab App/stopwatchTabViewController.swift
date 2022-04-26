//
//  FirstViewController.swift
//  Stopwatch Tab App
//
//  Created by Vanessa Aguilar on 10/11/20.
//  Copyright © 2020 Personal Team. All rights reserved.
//
import UIKit

class stopwatchTabViewController: UIViewController {
//MARK:Outlets
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerPicker: UIDatePicker!
  
    var timer = Timer()
    var countDownDuration : TimeInterval = 0.0
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        for family: String in UIFont.familyNames
          {
              print(family)
              for names: String in UIFont.fontNames(forFamilyName: family)
              {
                  print("== \(names)")
              }
          }
    }
    
    //Function to format what the label will look like 
    func timeString(from duration: TimeInterval) -> String {

     let dateFormed = DateComponentsFormatter()
        dateFormed.zeroFormattingBehavior = .pad
        dateFormed.allowedUnits = [.hour, .minute, .second]
        
        return dateFormed.string(from: duration)!
        
       }


//MARK:Actions
    //Once the play button is clickd the goal to create an instance
    //of timer and decrement the text label
    @IBAction func playButton(_ sender: Any) {
        countDownDuration = timerPicker.countDownDuration
     
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(decrementTimer), userInfo: nil, repeats: true)
      
 }
    //This function will make sure to deceremnt as long as it hasnt hit 0, the end of time
    //if its not 0 it will continue to decrease
    @objc func decrementTimer(_ timer : Timer) {
        
           if countDownDuration < 1 {
               timer.invalidate()
         
           } else {
            countDownDuration -= 1
            timerLabel.text = timeString(from: countDownDuration)
           }
       }
    //When the stop button is pressed the label will stop updating
    @IBAction func stopButton(_ sender: Any) {
            timer.invalidate()
    
    }
}
