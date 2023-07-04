//
//  OCSimpleTask.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/04.
//

import SwiftUI
import CareKitUI

struct SimpleTaskView: UIViewRepresentable {
    var title: String
    @Binding var selected: Bool
    var detail: String?
    
    func makeUIView(context: Context) -> OCKSimpleTaskView {
        let taskView = OCKSimpleTaskView()
        return taskView
    }
    
    func updateUIView(
        _ uiView: OCKSimpleTaskView,
        context: Context
    ) {
        uiView.headerView.titleLabel.text = loc(title)
        
        if let detail = detail {
            uiView.headerView.detailLabel.text = loc(detail)
        }
        
        uiView.completionButton.isSelected = selected
    }
}

struct SimpleTaskView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ContentView()
        }
    }
}
