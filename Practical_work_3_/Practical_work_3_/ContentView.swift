import SwiftUI

struct ContentView: View {
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        NavigationView {
            MainView()
                .navigationTitle(languageManager.translate("title"))
                .toolbar {
                    Button(languageManager.currentLanguage.uppercased()) {
                        languageManager.toggleLanguage()
                    }
                }
        }
    }
}

#Preview {
    ContentView().environmentObject(LanguageManager())
}
