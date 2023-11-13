//
//  ThemeSettings.swift
//  To Do App
//
//  Created by Adriancys Jesus Villegas Toro on 13/11/23.
//

import SwiftUI

// MARK: - Theme Class

final public class ThemeSettings: ObservableObject {
    @Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
        didSet {
            UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
        }
    }
    
    private init() {}
    
    public static let shared = ThemeSettings()
}
