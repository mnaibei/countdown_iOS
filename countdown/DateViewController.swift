//
//  DateViewController.swift
//  countdown
//
//  Created by Mucha Naibei on 10/09/2022.
//

import UIKit

class DateViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var field: UITextField!
    @IBOutlet var picker: UIDatePicker!
    
    public var completionHandler: ((String, Date) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.becomeFirstResponder()
        picker.tintColor = .white
        field.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func didTapButton(){
        if let text = field.text, !text.isEmpty{
            let pickedDatetime = picker.date
            completionHandler?(text, pickedDatetime)
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
}
