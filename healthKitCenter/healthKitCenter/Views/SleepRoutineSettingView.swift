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
                    await confirmButtonTapped()
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
    
    private func confirmButtonTapped() async {
        do {
            let sleepSchedule = OCKSchedule(
                composing: [
                    OCKScheduleElement(
                        start: .now,
                        end: nil,
                        interval: DateComponents(
                            calendar: .current,
                            day: 1
                        ),
                        text: "6시간 이상의 수면을 자야 건강에 좋습니다.",
                        duration: .hours(6)
                    )
                ]
            )
            
            var sleepTask = OCKTask(
                id: OCKStore.Tasks.sleep.rawValue,
                title: "수면 습관",
                carePlanUUID: nil,
                schedule: sleepSchedule
            )
            
            sleepTask.asset = "test.png"
            sleepTask.instructions = "수면을 잘 취하고 다음 날 아침 체크해주세요."
            
            try await myCareStore.addTask(sleepTask)
        } catch {
            dump(error)
        }
        
        withAnimation {
            isSleepCareRoutineConfirmed = true
        }
    }
}

struct SleepRoutineSettingView_Previews: PreviewProvider {
    static var previews: some View {
        SleepRoutineSettingView(currentTab: .constant(""))
    }
}
