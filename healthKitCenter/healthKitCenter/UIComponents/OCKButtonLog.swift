//
//  OCKButtonLog.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/04.
//

import SwiftUI
import CareKit
import CareKitUI
import CareKitStore
import UIKit

struct _ButtonLogView: UIViewRepresentable {
    @Binding var selected: Bool
    var title: String
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
        uiView.headerView.titleLabel.text = loc(title)
        
        uiView.updateItem(at: 0, withTitle: "hi", detail: "detail")
        
        if let detail = detail {
            uiView.headerView.detailLabel.text = loc(detail)
        }
    }
    
    func makeCoordinator() -> Self.Coordinator {
        Coordinator()
    }
}

struct OCKButtonLog_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            EmptyView()
        }
    }
}
