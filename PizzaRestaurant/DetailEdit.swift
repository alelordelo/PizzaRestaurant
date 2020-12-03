//
//  OrderEdit.swift
//  PizzaRestaurant
//
//  Created by Alexandre Lordelo on 2020-11-30.
//

import SwiftUI

struct DetailEdit: View {
    

    

    let pizzaTypes = ["Pizza Margherita", "Greek Pizza", "Pizza Supreme", "Pizza California", "New York Pizza"]

    
    @State var tableNumber = ""
    
    @State var selectedPizzaIndex = 1
    @State var numberOfSlices = 1
    
    @ObservedObject var order: Order

    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
   
    @State  var selectedFlavor = Flavor.chocolate
    
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
        
        //fetch data from core data  -> item edit
        .onAppear {
            
            self.tableNumber = self.order.tableNumber
           // self.selectedPizzaIndex = self.order.pizzaTypes
            
           // self.selectedFlavor.rawValue = self.order.flavor
            
           self.selectedFlavor = self.order.flavor
            
           // newOrder.flavor = self.selectedFlavor.rawValue

        }
        
        .navigationTitle("Edit Order")

    }
}
    
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
