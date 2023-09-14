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
    
    private func _initTasks() {
        let tasks: [OCKTask] = []
        
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
    public func makeTasks(
        on date: Date,
        _ instruction: String
    ) async -> OCKTask {
        let task = OCKTask(
            id: OCKStore.Tasks.sleep.rawValue,
            title: OCKStore.Tasks.sleep.rawValue,
            carePlanUUID: nil,
            schedule: .dailyAtTime(
                hour: Date.getHour(from: date),
                minutes: Date.getHour(from: date),
                start: date,
                end: nil,
                text: instruction
            )
        )
        
        return task
    }
}

// MARK: To get into EnvironmentObject
extension OCKStore: ObservableObject { }
