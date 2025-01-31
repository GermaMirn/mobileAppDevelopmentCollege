import SwiftUI

@main
struct PracticalWorkApp: App {
    @StateObject var languageManager = LanguageManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(languageManager)
        }
    }
}
