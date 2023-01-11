//
//  BackgroundServices.swift
//  LightTimer
//
//  Created by Home on 11.01.2023.
//

import UIKit

// Mark: - Background services
func doUpdate (in seconds: Int) {
    DispatchQueue.global(qos: .background).async {
        let taskID = beginBackgroundUpdateTask()

        UserDefaults.standard.set(taskID.rawValue, forKey: "MyTaskId")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds), execute: {
            
        })
        DispatchQueue.main.async {
            endBackgroundUpdateTask(taskID: taskID)
        }
    }
}

func beginBackgroundUpdateTask() -> UIBackgroundTaskIdentifier {
    return UIApplication.shared.beginBackgroundTask(expirationHandler: {})
}


func endBackgroundUpdateTask(taskID: UIBackgroundTaskIdentifier) {
    
    let taskId = UserDefaults.standard.integer(forKey: "MyTaskId")
    if taskId != 0 {
        let newTaskID = UIBackgroundTaskIdentifier(rawValue: taskId)
        UIApplication.shared.endBackgroundTask(newTaskID)
    }
}
