//
//  CareKit+StoreManager.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/08.
//

import CareKit
import CareKitStore

public struct CareKitStoreContainer {
    public static let shared = CareKitStoreContainer()
    
    let storeManager: any OCKStoreProtocol = {
        let store = OCKStore(name: "SleepStore", type: .inMemory)
        store.addTasks([
            .init(
                id: "SleepRoutine1",
                title: "SleepRoutine_Title",
                carePlanUUID: .init(),
                schedule: .dailyAtTime(
                    hour: 11,
                    minutes: 0,
                    start: .distantPast,
                    end: .distantFuture,
                    text: "Schedule_Text"
                )
            )
        ])
        return store
    }()
    
    private init() { }
}
