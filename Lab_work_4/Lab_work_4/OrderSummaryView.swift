import SwiftUI

struct OrderSummaryView: View {
    let order: String
    @Environment(\ .presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text(order)
                .font(.title2)
                .padding()
            Button("Назад") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
