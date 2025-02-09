import SwiftUI

struct OrderView: View {
    @State private var selectedBread: String = ""
    @State private var selectedDrink: String = ""
    var body: some View {
        VStack {
            Text("Ваш заказ")
                .font(.headline)
            Text("Хлеб")
            Picker("Хлеб", selection: $selectedBread) {
                Text("Белый").tag("Белый")
                Text("Чёрный").tag("Чёрный")
            }.pickerStyle(SegmentedPickerStyle())
            
            Text("Напиток")
            Picker("Напиток", selection: $selectedDrink) {
                Text("Чай").tag("Чай")
                Text("Сок").tag("Сок")
                Text("Минеральная вода").tag("Минеральная вода")
            }.pickerStyle(SegmentedPickerStyle())
            
            NavigationLink("Отправить заказ", destination: OrderSummaryView(order: "Вы заказали: \(selectedBread) хлеб и \(selectedDrink)"))
        }
    }
}
