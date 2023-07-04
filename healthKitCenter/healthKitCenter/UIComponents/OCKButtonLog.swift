//
//  OCKButtonLog.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/04.
//

import SwiftUI
import CareKit
import CareKitUI
import UIKit

struct ButtonLogView: UIViewRepresentable {
    var title: String
    @Binding var selected: Bool
    var detail: String?
    var instruction: String?
    
    func makeUIView(context: Context) -> OCKButtonLogTaskView {
        let buttonLogTaskView = OCKButtonLogTaskView()
        return buttonLogTaskView
    }
    
    func updateUIView(
        _ uiView: OCKButtonLogTaskView,
        context: Context
    ) {
//        uiView.delegate = context.coordinator
        
        uiView.headerView.titleLabel.text = loc(title)
        
        uiView.updateItem(at: 0, withTitle: "hi", detail: "detail")
        
        if let detail = detail {
            uiView.headerView.detailLabel.text = loc(detail)
        }
        
        if let instruction {
//           uiView.instructionsLabel.text = loc(instruction)
            
        }
    }
    
    func makeCoordinator() -> Self.Coordinator {
        Coordinator()
    }
    
//    class Coordinator: NSObject, OCKTaskViewDelegate {
//        func taskView(
//            _ taskView: UIView & CareKitUI.OCKTaskDisplayable,
//            didCompleteEvent isComplete: Bool,
//            at indexPath: IndexPath,
//            sender: Any?
//        ) {
//            <#code#>
//        }
//
//        func taskView(
//            _ taskView: UIView & CareKitUI.OCKTaskDisplayable,
//            didSelectOutcomeValueAt index: Int,
//            eventIndexPath: IndexPath,
//            sender: Any?
//        ) {
//            <#code#>
//        }
//
//        func taskView(
//            _ taskView: UIView & CareKitUI.OCKTaskDisplayable,
//            didCreateOutcomeValueAt index: Int,
//            eventIndexPath: IndexPath, sender: Any?
//        ) {
//            <#code#>
//        }
//
//        func didSelectTaskView(
//            _ taskView: UIView & CareKitUI.OCKTaskDisplayable,
//            eventIndexPath: IndexPath
//        ) {
//            <#code#>
//        }
//    }
}

struct OCKButtonLog_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLogView(
            title: "Title_Mock",
            selected: .constant(.random()),
            detail: "Detail_Mock",
            instruction: "Instruction_Mock"
        )
    }
}
