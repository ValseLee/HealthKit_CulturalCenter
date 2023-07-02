import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project
// Creates our project using a helper function defined in ProjectDescriptionHelpers

let project = Project.mainApp(
    name: "HealthKit-CulturalCenter",
    platform: .iOS,
    targetDependencies: [
        .features,
        .commonUI,
    ]
)
