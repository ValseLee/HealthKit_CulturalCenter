//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Celan on 2023/07/02.
//

import ProjectDescription

let project = Project.framework(
    name: "Core",
    platform: .ios,
    targetDependencies: [
        .careKit
    ]
)
