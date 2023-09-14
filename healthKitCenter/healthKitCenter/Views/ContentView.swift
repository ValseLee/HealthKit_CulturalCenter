//
//  ContentView.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/03.
//

import CareKit
import CareKitStore
import SwiftUI

struct ContentView: View {
    @State private var tabs = "first"
    
    var body: some View {
        TabView(selection: $tabs) {
            CareRoutineSelectView(currentTab: $tabs)
                .tag("first")
            
            SleepRoutineSettingView(currentTab: $tabs)
                .tag(OCKStore.Tasks.sleep.rawValue)
            
            SleepRoutineTaskView()
                .tag("\(OCKStore.Tasks.sleep.rawValue)Task")
        }
        .tabViewStyle(.page)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


