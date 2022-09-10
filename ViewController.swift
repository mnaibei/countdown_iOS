//
//  ViewController.swift
//  countdown
//
//  Created by Mucha Naibei on 10/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var hours: Int = 0
    var min: Int = 0
    var secs: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func didTapAddButton(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "date_picker") as! DateViewController
        vc.title = "New Event"
        vc.completionHandler = { [weak self] name, date in
            
            DispatchQueue.main.async{
            self?.didCreateEvent(name: name, targetDate: date)
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func didCreateEvent(name: String, targetDate: Date){
        self.title = name
        let difference = targetDate.timeIntervalSince(Date())
        if difference > 0.0{
            let computedHours: Int = Int(difference) / 3600
            let remainder: Int  = Int(difference) - (computedHours * 3600)
            let minutes: Int = remainder / 60
            let seconds: Int = Int(difference) - (computedHours * 3600) - (minutes * 60)
            
            print("\(computedHours) \(minutes) \(seconds)")
            
            hours = computedHours
            min = minutes
            secs = seconds
            updateLabel()
            
            startTimer()
            
        }
        else{
            print("Negative")
        }
    }
    
    private func startTimer(){
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true , block:{ _ in
            if self.secs > 0{
                self.secs = self.secs - 1
            }
            else if self.min > 0 && self.secs == 0 {
                self.min = self.min  - 1
                self.secs = 59
            }
            else if self.hours > 0 && self.min == 0 && self.secs == 0 {
                self.hours = self.hours - 1
                self.min = 59
                self.secs = 59
            }
            self.updateLabel()
        })
    }
    
    private func updateLabel(){
        label.text = "\(hours): \(min): \(secs )"
 
    }
}

