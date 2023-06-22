//
//  AddView.swift
//  Moi_rashody
//
//  Created by mac on 08.11.2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode// переход на 1 страницу 1 часть
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    let types = ["Bussines", "Personal"]
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Название", text: $name)
                Picker("Тип", selection: $type) {
                    ForEach(self.types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Стоимость", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Добавить")
            .navigationBarItems(trailing: Button("Сохранить"){
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss() // переход на первую страницу 2 часть
                }
            })
        }
    }
}



struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
