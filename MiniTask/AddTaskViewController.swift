//
//  AddTaskViewController.swift
//  MiniTask
//
//  Created by Amee Thakkar on 7/2/18.
//  Copyright © 2018 Amee Thakkar. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var addTaskBtn: UIButton!
    
    var tasks = ["Select task", "Go to the dentist", "Finish homework", "Pick up the kids", "Meet Friends", "Prepare lunch for tomorrow", "Read newspaper", "Take driving lessons", "Play badminton", "Clean the house"]
    
    var dateFormatter = DateFormatter()
    var selectedTask = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.dataSource = self
        pickerView.delegate = self
        addTaskBtn.isEnabled = false
        
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        datePicker.minimumDate = Date()
        
        addTaskBtn.layer.cornerRadius = 5
        addTaskBtn.layer.borderColor = UIColor.white.cgColor
        addTaskBtn.layer.borderWidth = 1
        addTaskBtn.clipsToBounds = true
        
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tasks.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tasks[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if row == 0 {
            addTaskBtn.isEnabled = false
        }
        else {
            addTaskBtn.isEnabled = true
            selectedTask = tasks[row]
        }
    }
    @IBAction func addTaskClick(_ sender: Any) {
        let date = datePicker.date
        let dateStr = dateFormatter.string(from: date)
        
        taskArray.append(selectedTask)
        dateArray.append(dateStr)
        
        dismiss(animated: true, completion: nil)
    }
    
    


}
