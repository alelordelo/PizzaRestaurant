//
//  OrderEdit.swift
//  PizzaRestaurant
//
//  Created by Alexandre Lordelo on 2020-11-30.
//

import SwiftUI

struct DetailEdit: View {
    
    @State var tableNumber = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @ObservedObject var order: Order
    
   // var order = Order()

    var body: some View {
        
        NavigationView {

        
        Form {
        
            TextField("table number", text: $tableNumber)
            
            
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
