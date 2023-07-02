//
//  Mock.swift
//  Feature
//
//  Created by Celan on 2023/07/01.
//  Copyright © 2023 Celan. All rights reserved.
//

import Foundation
import CareKitStore

public struct PersonalSleepInfo {
    public var id: UUID
    public var name: String
    public var inBedTime: String
    public var wakeUpTime: String
    
}

extension PersonalSleepInfo: Equatable, Identifiable { }
