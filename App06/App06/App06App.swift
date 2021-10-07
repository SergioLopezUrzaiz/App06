//
//  App06App.swift
//  App06
//
//  Created by Alumno on 07/10/21.
//

import SwiftUI
import Firebase

@main
struct App06App: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}
