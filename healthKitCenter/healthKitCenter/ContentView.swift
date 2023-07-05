//
//  ContentView.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/03.
//

import CareKit
import CareKitUI
import SwiftUI

struct ContentView: View {
    @State private var simpleSelected: Bool = false
    @State private var instructionSelected: Bool = false
    
    var body: some View {
        ScrollView {
            SimpleTaskView(
                title: "Title",
                selected: $simpleSelected,
                detail: "Details"
            )
            .frame(
                maxWidth: .infinity,
                minHeight: 100,
                maxHeight: 200
            )
            .padding()
            
            InstructionTaskView(
                title: "Title",
                selected: $instructionSelected,
                detail: "Detail",
                instruction: "Instruction: Do this Do That"
            )
            .frame(
                maxWidth: .infinity,
                minHeight: 100,
                maxHeight: 300
            )
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


