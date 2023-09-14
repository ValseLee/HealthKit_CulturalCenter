//
//  healthKitCenterApp.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/03.
//

import CareKitStore
import SwiftUI

@main
struct healthKitCenterApp: App {
    @StateObject var myCareStore = CareKitStoreContainer()
        .myCareStore
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(myCareStore)
        }
    }
}
