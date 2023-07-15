//
//  SleepRoutineSettingView.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/09.
//

import SwiftUI
import CareKitStore

struct SleepRoutineSettingView: View {
    @EnvironmentObject var myCareStore: OCKStore
    @Binding var currentTab: String
    @State private var date: Date = .now
    @State private var isSleepCareRoutineConfirmed: Bool = false
    
    var body: some View {
        VStack {
            Text("What time do you want to get to sleep?")
            
            DatePicker(
                "",
                selection: $date,
                displayedComponents: .hourAndMinute
            )
                .labelsHidden()
                .datePickerStyle(.wheel)
            
            Text(date.formatted())
            
            Button {
                Task {
                    do {
                        // Init Store's Care Routine
//                        let _ = await myCareStore.makeTasks(
//                            on: date,
//                            "Please Tap the button, when you're about to sleep :)"
//                        )
                        
                        do {
                            let _ = try await myCareStore.addTask(
                                OCKTask(
                                    id: OCKStore.Tasks.sleep.rawValue,
                                    title: OCKStore.Tasks.sleep.rawValue,
                                    carePlanUUID: nil,
                                    schedule: .dailyAtTime(
                                        hour: Date.getHour(from: date),
                                        minutes: Date.getHour(from: date),
                                        start: date,
                                        end: nil,
                                        text: "Please Tap the button, when you're about to sleep :)"
                                    )
                                )
                            )
                        } catch {
                            dump(error)
                        }
                        
                        withAnimation {
                            isSleepCareRoutineConfirmed = true
                        }
                    }
                }
                
            } label: {
                VStack {
                    Text("Confirm")
                    Text(
                    """
                    \(Date.getHour(from: date).formatted()) : \(Date.getMinute(from: date).formatted())
                    """
                    )
                }
            }
            
            if isSleepCareRoutineConfirmed {
                Button {
                    currentTab = "\(OCKStore.Tasks.sleep.rawValue)Task"
                } label: {
                    Text("GO To My Routine")
                }
            }
        }
    }
}

struct SleepRoutineSettingView_Previews: PreviewProvider {
    static var previews: some View {
        SleepRoutineSettingView(currentTab: .constant(""))
    }
}
