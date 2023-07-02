import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "Feature",
    platform: .iOS,
    targetDependencies: [
        .appCore,
    ]
)
