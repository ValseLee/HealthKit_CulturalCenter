//
//  CareKitUIContainers.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/09.
//

import CareKit
import CareKitStore
import UIKit

final class CareViewController: OCKDailyPageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func dailyPageViewController(
        _ dailyPageViewController: OCKDailyPageViewController,
        prepare listViewController: OCKListViewController,
        for date: Date
    ) {
        let identifiers = [
            OCKStore.Tasks.sleep.rawValue,
            OCKStore.Tasks.diet.rawValue
        ]
        
        var query = OCKTaskQuery(for: date)
        query.ids = identifiers
        query.excludesTasksWithNoEvents = true
        
        store.fetchAnyTasks(
            query: query,
            callbackQueue: .main) { result in
                switch result {
                case let .failure(failure): print(failure.errorDescription)
                case let .success(success):
                    if let sleepTask = success.first(where: {
                        $0.id == OCKStore.Tasks.sleep.rawValue
                    }) {
                        
                    }
                }
            }
    }
}

struct CareKitUIContainer {
    enum CareKitUIStyles {
        case buttonLog(OCKAnyStoreProtocol)
        case simpleTask(OCKAnyStoreProtocol)
        case instructionTask(OCKAnyStoreProtocol)
    }
    
    public var style: CareKitUIStyles
    
    public var body: UIViewController {
        switch style {
        case let .buttonLog(store):
            let buttonLogTaskVC = OCKButtonLogTaskViewController(
                query: OCKEventQuery(for: .now),
                // App에서 관리하는 OCKStore를 전달하여 VC 구성
                store: store
            )
            
            return buttonLogTaskVC
            
        case let .simpleTask(store):
            let simpleTaskVC = OCKSimpleTaskViewController(
                query: .init(for: .now),
                store: store
            )
            
            return simpleTaskVC
            
        case let .instructionTask(store):
            let instructionTaskVC = OCKInstructionsTaskViewController(
                query: .init(for: .now),
                store: store
            )
            
            return instructionTaskVC
        }
    }
}
