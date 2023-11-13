//
//  To_Do_AppApp.swift
//  To Do App
//
//  Created by Adriancys Jesus Villegas Toro on 1/11/23.
//

import SwiftUI

@main
struct To_Do_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(IconNames())
        }
    }
}

class IconNames: ObservableObject {
    
    var iconNames: [String?] = [nil]
    @Published var currentIndex = 0
    
    init() {
        getAlternateIconNames()
        
        if let currentIcon = UIApplication.shared.alternateIconName {
            self.currentIndex = iconNames.firstIndex(of: currentIcon) ?? 0
        }
    }
    
    func getAlternateIconNames() {
        if let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any],
           let alternateIcons = icons["CFBundelalternateIcons"] as? [String: Any] {
            for (_, value) in alternateIcons {
                guard let iconsList = value as? Dictionary<String,Any> else { return }
                guard let iconFiles = iconsList["CFBundleIconFiles"] as? [String] else { return }
                guard let icon = iconFiles.first else { return }
                iconNames.append(icon)
             }
        }
    }
}
