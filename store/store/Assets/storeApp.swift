//
//  storeApp.swift
//  store
//
//  Created by Greylin on 4/4/25.
//

import SwiftUI

@main
struct storeApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CartViewModel())
        }
    }
}
