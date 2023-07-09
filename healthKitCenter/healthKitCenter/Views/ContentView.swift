//
//  ContentView.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/03.
//

import SwiftUI
import CareKit
import CareKitStore

struct ContentView: View {
    @State private var tabs = "first"
    @State private var isSleepCourseSelected: Bool = false
    @State private var isEatingCourseSelected: Bool = false
    
    var body: some View {
        TabView(selection: $tabs) {
            firstStep
                .tag("first")
            
            secondStep
                .tag("second")
        }
        .tabViewStyle(.page)
    }
    
    var firstStep: some View {
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
            
            if isEatingCourseSelected || isSleepCourseSelected {
                Button {
                    withAnimation {
                        tabs = "second"
                    }
                } label: {
                    Text("next")
                }
            }
        }
    }
    
    var secondStep: some View {
        Text("HO")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


