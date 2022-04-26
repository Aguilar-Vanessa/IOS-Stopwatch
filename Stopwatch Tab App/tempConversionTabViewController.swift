//
//  SecondViewController.swift
//  Stopwatch Tab App
//
//  Created by Vanessa Aguilar on 10/11/20.
//  Copyright © 2020 Personal Team. All rights reserved.
//

import UIKit

class tempConversionTabViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
  //Global Variables
    var celsius: [Int] = []
    var fahrenheitTemps: [Int] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fahrenheitTemps += -129...134
        celsius += -90...57

        
    }
//MARK:Outlets
    @IBOutlet weak var convertedLabel: UILabel!
    @IBOutlet weak var tempPicker: UIPickerView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
//MARK:Action
    //Function will make sure that when the segmented control is switched
    //from one to the other it will reload the new picker values
    @IBAction func conversionSegmentedControl(_ sender: Any) {

     self.tempPicker.reloadComponent(0)
    }

//MARK:Functions
    
    //Returning how many components is it working with, we only have one row
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Specifies how many rows does a given componenet contain
    //Here we are switching off from either farenheit or celsius depending
    //on which one the user selects
   public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch
            segmentControl.selectedSegmentIndex{
        case 0:
            return fahrenheitTemps.count
        default:
            return celsius.count
        }
    }
  
//MARK: Picker view delegate method
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int , forComponent component: Int) -> String?{
    
        switch segmentControl.selectedSegmentIndex {
            case 0:
                //Getting the int that was selected from picker view
                var selected = fahrenheitTemps[tempPicker.selectedRow(inComponent: 0)]
                    selected = (selected - 32) * 5/9  //once retrieved convert & display
                    convertedLabel.text = String("\(selected) \u{2103}")
                
                    let myString = fahrenheitTemps.map { String($0)}
                return myString[row] + " \u{2109}" //appending special car to picker
        default:
                //Getting the int that was selected from picker view
                var selected = celsius[tempPicker.selectedRow(inComponent: 0)]
                       selected = (selected * 9/5) + 32  //once retrieved convert & display
                       convertedLabel.text = String("\(selected) \u{2109}")
                    let myString = celsius.map { String($0)}
                return myString[row] + " \u{2103}" //appending special car to picker
        }

    }
}
