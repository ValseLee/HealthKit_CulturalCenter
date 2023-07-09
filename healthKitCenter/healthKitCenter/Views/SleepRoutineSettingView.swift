//
//  SleepRoutineSettingView.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/09.
//

import SwiftUI

struct SleepRoutineSettingView: View {
    @EnvironmentObject var storeManager: CareKitStoreContainer
    @Binding var currentTab: String
    @State private var date: Date = .now
    
    var body: some View {
        DatePicker(
            "",
            selection: $date,
            displayedComponents: .hourAndMinute
        )
            .labelsHidden()
            .datePickerStyle(.wheel)
    }
}

struct SleepRoutineSettingView_Previews: PreviewProvider {
    static var previews: some View {
        SleepRoutineSettingView(currentTab: .constant(""))
    }
}
