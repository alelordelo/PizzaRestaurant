//
//  OrderEdit.swift
//  PizzaRestaurant
//
//  Created by Alexandre Lordelo on 2020-11-30.
//

import SwiftUI

struct DetailEdit: View {
    

    //BB: VALUES GETTING DERIVED FROM DETAIL VIEW
    let pizzaTypes: [String]
    @State var tableNumber: String
    @State var selectedPizzaIndex: Int
    @State var numberOfSlices: Int
    @State var selectedFlavor: Flavor
    
    @ObservedObject var order: Order
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    enum Flavor: String, CaseIterable, Identifiable {
        case chocolate
        case vanilla
        case strawberry

        var id: String { self.rawValue }
    }
    

    var body: some View {
        
        NavigationView {

        
        Form {
            
            Picker("Flavor", selection: $selectedFlavor) {
                Text("Chocolate").tag(Flavor.chocolate)
                Text("Vanilla").tag(Flavor.vanilla)
                Text("Strawberry").tag(Flavor.strawberry)
            }
            Text("Selected flavor: \(selectedFlavor.rawValue)")
            

            TextField("table number", text: $tableNumber)
            
            Picker(selection: $selectedPizzaIndex, label: Text("Pizza Type")) {
                ForEach(0 ..< pizzaTypes.count) {
                        Text(self.pizzaTypes[$0]).tag($0)
                }
            }
            
            
            //update button
            Button(action: {
                updateOrder(order: order)
            }) {
                Text("Update")
                    .foregroundColor(.blue)
            }
        
        }

        
        .navigationTitle("Edit Order")

    }
}
    
    //BB: NEEDS TO BE COMPLETED
    func updateOrder(order: Order) {
        
        let newtableNumber = tableNumber

        
        viewContext.performAndWait {
            
        order.tableNumber = newtableNumber
        order.flavor = selectedFlavor.rawValue
            
           // order.flavor =
            
            try? viewContext.save()
        }
    }
    
  
    
//struct OrderEdit_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailEdit()
//    }
// }
}
