//
//  TimerViewController.swift
//  LightTimer
//
//  Created by Home on 03.01.2023.
//

import UIKit


class TimerViewController: UIViewController {
    
    var buttonNumber = 1
    
    @IBOutlet weak var timerAfter: UIDatePicker!
    @IBOutlet weak var timerIn: UIDatePicker!
    
    var taskID: UIBackgroundTaskIdentifier?
    
    
    @IBAction func cancelTapped(_ sender: Any) {
        
        let taskId = UIBackgroundTaskIdentifier(rawValue: UserDefaults.standard.integer(forKey: "MyTaskId"))
        endBackgroundUpdateTask(taskID: taskId)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        var seconds = 0
        switch buttonNumber {
        case 1:

            let calendar = Calendar.current
            let dateComponents = calendar.dateComponents([.hour, .minute], from: timerAfter.date)
            
            seconds = (dateComponents.hour!  * 60 + dateComponents.minute!) * 60
            
            
        case 2:
            let time = timerIn.date.timeIntervalSince(Date())
            
            
            print(time.description)
            print(Date())
        default: return
        }
        
        saveTime(seconds)
        self.navigationController?.popViewController(animated: true)

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        
        if buttonNumber == 1 {
            
            configureOffAfter()
            
        }
        else
        {
            timerIn.minimumDate = Calendar.current.date(byAdding: .minute, value: 5, to: Date())
            configureOffIn()
        }
    }

    
    //MARK: - Private
    private func configureOffAfter() {
        
        timerAfter?.isHidden = false
        timerIn?.isHidden = true
    }
    
    private func configureOffIn() {
        timerAfter?.isHidden = true
        timerIn?.isHidden = false
    }
    
    private func saveTime(_ seconds: Int) {
        torchON()
        doUpdate(in: seconds)
    }
    
}

