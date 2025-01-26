import SwiftUI

struct LoseView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Неправильно :(")
                .font(.system(size: 48))
                .foregroundColor(Color(hex: "#3A4856"))
                .padding()

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("ЕЩЕ РАЗ")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "#3CC08E"))
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.top, 20)
        }
    }
}
