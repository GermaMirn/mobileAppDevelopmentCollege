import SwiftUI

struct MainView: View {
    @EnvironmentObject var languageManager: LanguageManager

    let topics = ["qualifiers", "layouts"]

    var body: some View {
        List(topics, id: \.self) { topic in
            NavigationLink(destination: DetailView(topicKey: topic)) {
                Text(languageManager.translate(topic))
            }
        }
    }
}

#Preview {
    MainView().environmentObject(LanguageManager())
}
