//
//  OCKInstructionTask.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/04.
//

import SwiftUI
import CareKitUI

struct InstructionTaskView: UIViewRepresentable {
    var title: String
    @Binding var selected: Bool
    var detail: String?
    var instruction: String?
    
    func makeUIView(context: Context) -> OCKInstructionsTaskView {
        let instructionTaskView = OCKInstructionsTaskView()
        return instructionTaskView
    }
    
    func updateUIView(
        _ uiView: OCKInstructionsTaskView,
        context: Context
    ) {
        uiView.headerView.titleLabel.text = loc(title)
        
        if let detail = detail {
            uiView.headerView.detailLabel.text = loc(detail)
        }
        
        if let instruction {
            uiView.instructionsLabel.text = loc(instruction)
        }
        
        uiView.completionButton.isSelected = selected
    }
}

struct InstructionTaskView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
//        ScrollView {
            InstructionTaskView( // View가 사라짐니다..?
                title: "title_Mock",
                selected: .constant(.random()),
                detail: "Detail_Mock",
                instruction: "이렇게 하세요."
            )
        }
    }
}
