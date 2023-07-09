//
//  AppStore.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/08.
//

import SwiftUI
import CareKitStore

extension OCKStore {
    enum Tasks: String, CaseIterable {
        case sleep
        case diet
    }
    
    func _initTasks() {
        var tasks: [OCKTask] = []
        tasks.append(self.makeTasks(on: 1))
        
        addTasks(
            tasks,
            callbackQueue: .main
        ) { result in
            switch result {
            case .success: break
            case let .failure(err): dump(err)
            }
        }
    }
    
    // MARK: Methods
    func makeTasks(on days: Int) -> OCKTask {
        let task = OCKTask(
            id: OCKStore.Tasks.sleep.rawValue,
            title: OCKStore.Tasks.sleep.rawValue,
            carePlanUUID: nil,
            // 11:00
            schedule: .dailyAtTime(hour: 23, minutes: 0, start: .now.adding(days: -days), end: nil, text: nil)
        )
        print(#function, task)
        
        return task
    }
}
