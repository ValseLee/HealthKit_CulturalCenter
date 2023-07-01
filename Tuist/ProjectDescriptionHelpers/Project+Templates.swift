import ProjectDescription

extension TargetDependency {
    //    // MARK: SDK
    //    public static let healthKit: Self = .sdk(name: "HealthKit", type: .framework)
    //    public static let careKit: Self = .sdk(name: "CareKit", type: .framework)
    //    public static let swiftUI: Self = .sdk(name: "SwiftUI", type: .framework)
    
    // MARK: Frameworks
    public static let features: Self = .project(
        target: "Feature",
        path: .relativeToRoot("Feat/")
    )
    
    public static let commonUI: Self = .project(
        target: "commonUI",
        path: .relativeToRoot("UI")
    )
}

private extension Path {
    static let sourcePath: Self = .relativeToManifest("Sources/**")
    static let resourcePath: Self = .relativeToManifest("Resources/**")
    static let testPath: Self = .relativeToManifest("Sources/Tests/**")
}

private extension Settings {
    static func celanDevTeam(
        config: [Configuration]
    ) -> Self {
        return .settings(
            base: SettingsDictionary()
                .automaticCodeSigning(devTeam: "67M6ZS7KS6"),
            configurations: config
        )
    }
}

extension Project {
    static let orgName = "Celan"
    static func getBundleID(appName: String) -> String {
        "com.\(orgName).\(appName)"
    }
    
    /// Helper function to create the Project for this ExampleApp
    public static func mainApp(
        name: String,
        platform: Platform,
        targetDependencies: [TargetDependency]
    ) -> Project {
        
        let mainApp = Project(
            name: name,
            organizationName: orgName,
            targets:
                makeAppTargets(
                    name: name,
                    platform: platform,
                    dependencies: targetDependencies
                )
        )
        
        return mainApp
    }
    
    /// Frameworks
    public static func framework(
        name: String,
        platform: Platform,
        targetDependencies: [TargetDependency]
    ) -> Project {
        let framework = Project(
            name: name,
            organizationName: orgName,
            targets:
                makeFrameworkTargets(
                    name: name,
                    platform: platform,
                    dependencies: targetDependencies
                )
        )
        
        return framework
    }
    
    private static func makeAppTargets(
        name: String,
        platform: Platform,
        dependencies: [TargetDependency]
    ) -> [Target] {
        let platform: Platform = platform
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
        ]
        
        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: getBundleID(appName: name),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: [.glob(.sourcePath)],
            resources: [.glob(pattern: .resourcePath)],
            dependencies: dependencies,
            settings: .celanDevTeam(config: [])
        )
        
        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: getBundleID(appName: "\(name+"Tests")"),
            infoPlist: .default,
            sources: [.glob(.testPath)],
            dependencies: [
                .target(name: "\(name)")
            ],
            settings: .celanDevTeam(config: [])
        )
        
        return [mainTarget, testTarget]
    }
    
    public static func makeFrameworkProject(
        name: String,
        dependencies: [TargetDependency]
    ) -> Project {
        return Project(
            name: name,
            organizationName: orgName,
            targets: makeFrameworkTargets(
                name: orgName,
                platform: .iOS,
                dependencies: dependencies
            )
        )
    }
    /// Helper function to create a framework target and an associated unit test target
    private static func makeFrameworkTargets(
        name: String,
        platform: Platform,
        dependencies: [TargetDependency]
    ) -> [Target] {
        let sources = Target(
            name: name,
            platform: platform,
            product: .framework,
            bundleId: getBundleID(appName: name),
            infoPlist: .default,
            sources: [.glob(.sourcePath)],
            resources: [],
            dependencies: dependencies,
            settings: .celanDevTeam(config: [])
        )
        
        let tests = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: getBundleID(appName: "\(name+"Tests")"),
            infoPlist: .default,
            sources: [.glob(.testPath)],
            resources: [],
            dependencies: [.target(name: name)],
            settings: .celanDevTeam(config: [])
        )
        
        return [sources, tests]
    }
}
