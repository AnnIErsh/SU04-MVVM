//
//  SU02App.swift
//  SU02
//
//  Created by Anna Ershova on 20.12.2021.
//

import SwiftUI
import Core

@main
struct SU02App: App {
    init() {
        Configurator.shared.register()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
