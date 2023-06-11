

import SwiftUI

@main
struct AppMain: App {
  
  let model = IceCreamDataStore()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(model)
    }
  }
}
