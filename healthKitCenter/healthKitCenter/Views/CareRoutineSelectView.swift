//
//  CareRoutineSelectView.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/09.
//

import CareKitStore
import SwiftUI

struct CareRoutineSelectView: View {
    @Binding var currentTab: String
    @State private var isSleepCourseSelected: Bool = false
    @State private var isEatingCourseSelected: Bool = false
    
    var body: some View {
        VStack {
            Text("Which Care Course do you want?")
                .bold()
                .padding(.bottom, 32)
            
            Button {
                withAnimation {
                    if isEatingCourseSelected { isEatingCourseSelected = false }
                    if isSleepCourseSelected { isSleepCourseSelected = false }
                    isSleepCourseSelected = true
                }
            } label: {
                Label(
                    "Sleep",
                    systemImage: isSleepCourseSelected ? "square.fill" : "square"
                )
                .frame(width: 100, height: 30)
            }
            
            Button {
                withAnimation {
                    if isSleepCourseSelected { isSleepCourseSelected = false }
                    if isEatingCourseSelected { isEatingCourseSelected = false }
                    isEatingCourseSelected = true
                }
            } label: {
                Label(
                    "Diet",
                    systemImage: isEatingCourseSelected ? "square.fill" : "square"
                )
                .frame(width: 100, height: 30)
            }
            .padding(.bottom, 32)
            
            if isEatingCourseSelected || isSleepCourseSelected {
                Button {
                    withAnimation {
                        if isSleepCourseSelected { currentTab = OCKStore.Tasks.sleep.rawValue }
                        else if isEatingCourseSelected {
                            currentTab = OCKStore.Tasks.diet.rawValue
                        }
                    }
                } label: {
                    Text("next")
                }
            }
        }
    }
}

struct CareRoutineSelectView_Previews: PreviewProvider {
    static var previews: some View {
        CareRoutineSelectView(currentTab: .constant(""))
    }
}
