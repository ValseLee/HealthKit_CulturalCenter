//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Celan on 2023/07/02.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "AppCore",
    platform: .iOS,
    targetDependencies: [
        .careKit
    ]
)
