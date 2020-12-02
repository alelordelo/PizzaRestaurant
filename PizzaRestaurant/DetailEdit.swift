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
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
   
    
    @ObservedObject var order: Order
    

    var body: some View {
        
        NavigationView {

        
        Form {
        
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
        
        //passing data item detail -> item edit
        .onAppear {
            self.tableNumber = self.order.tableNumber
            
            
           // newOrder.flavor = self.selectedFlavor.rawValue

        }
        
        .navigationTitle("Edit Order")

    }
}
    
    func updateOrder(order: Order) {
        let newtableNumber = tableNumber
        viewContext.performAndWait {
            order.tableNumber = newtableNumber
            try? viewContext.save()
        }
    }
    
  
    
//struct OrderEdit_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailEdit()
//    }
// }
}
