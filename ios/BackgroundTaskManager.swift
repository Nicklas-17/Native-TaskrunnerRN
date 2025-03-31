//
//  BackgroundTaskManager.swift
//  NativeTaskrunnerRN
//
//  Created by Nicklas on 31/03/2025.
//

import Foundation
import BackgroundTasks
import React

@objc(BackgroundTaskManager)
class BackgroundTaskManager: NSObject {
  
  @objc static func requireMainQueue() -> Bool {
    return false
  }
  
  @objc func registerBackgroundTask(_ taskIdentifier: String,
                                    resolver: RCTPromiseResolveBlock,
                                    rejecter: RCTPromiseRejectBlock) {
      BGTaskScheduler.shared.register(forTaskWithIdentifier: taskIdentifier, using: nil) { task in
          if let processingTask = task as? BGProcessingTask {
              self.handleBackgroundTask(task: processingTask)
          } else {
              print("Unexpected task type received: \(task)")
              task.setTaskCompleted(success: false)
          }
      }
      resolver(true)
  }

  private func handleBackgroundTask(task: BGProcessingTask) {
    scheduleNextTask()
    task.expirationHandler = {
      task.setTaskCompleted(success: false)
    }
    
    DispatchQueue.global(qos: .background).async {
      print("Background task completed")
      task.setTaskCompleted(success: true)
    }
  }

  private func scheduleNextTask() {
    let request = BGProcessingTaskRequest(identifier: "com.nativeTaskrunner.task")
    request.requiresNetworkConnectivity = false
    request.requiresExternalPower = false
    
    do {
      try BGTaskScheduler.shared.submit(request)
    } catch {
      print("Could not schedule background task: \(error)")
    }
  }
}
