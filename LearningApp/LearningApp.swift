//
//  LearningApp.swift
//  LearningApp
//
//  Created by Michael Shahidi on 6/15/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
