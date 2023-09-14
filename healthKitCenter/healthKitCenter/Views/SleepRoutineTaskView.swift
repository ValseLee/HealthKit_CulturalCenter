//
//  SleepRoutineTaskView.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/14.
//

import CareKit
import CareKitStore
import SwiftUI

struct SleepRoutineTaskView: View {
    @EnvironmentObject var myCareStore: OCKStore
    
    var body: some View {
        SleepRoutineButtonTaskView(myCareStore: myCareStore)
    }
}

struct SleepRoutineButtonTaskView: UIViewControllerRepresentable {
    let myCareStore: OCKStore
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let container = CareKitUIContainer(style: .buttonLog(myCareStore))
        return container.body
    }
    
    func updateUIViewController(
        _ uiViewController: UIViewControllerType,
        context: Context
    ) {
        // code
    }
    
//    func sizeThatFits(
//        _ proposal: ProposedViewSize,
//        uiViewController: some UIViewControllerType,
//        context: Context
//    ) -> CGSize? {
//        return CGSize(
//            width: UIScreen.main.bounds.width - 20,
//            height: 400
//        )
//    }
}

struct SleepRoutineTaskView_Previews: PreviewProvider {
    static var previews: some View {
        SleepRoutineTaskView()
    }
}
