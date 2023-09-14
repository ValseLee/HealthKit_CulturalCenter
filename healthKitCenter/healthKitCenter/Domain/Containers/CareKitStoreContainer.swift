//
//  CareKit+StoreManager.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/08.
//

import CareKit
import CareKitStore

final class CareKitStoreContainer {
    public let myCareStore: OCKStore = {
        let store = OCKStore(name: "MyCareStore", type: .inMemory)
        return store
    }()
    
    // MARK: Life-Cycle
    public init() { }
}
