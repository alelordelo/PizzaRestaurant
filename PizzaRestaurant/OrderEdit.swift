//
//  OrderEdit.swift
//  PizzaRestaurant
//
//  Created by Alexandre Lordelo on 2020-11-30.
//

import SwiftUI

struct OrderEdit: View {
    
    @State var tableNumber = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode


    var order = Order()

    var body: some View {
        
        NavigationView {

        
        Form {
        
            TextField("table number", text: $tableNumber)
        
        }
        
        //passing data item detail -> item edit
             
        .onAppear {
            
            self.tableNumber = self.order.tableNumber
   
            

        }
        .navigationTitle("Edit Order")
        .toolbar {
            
            //done button
            ToolbarItem(placement: .confirmationAction) {
                Button(action: editOrderCD) {
                    Text("Done")
                }
        }
        

                
            }
    }
}
    
    private func editOrderCD() {
        

        let editOrder = Order(context: viewContext)
        
        
        editOrder.tableNumber = tableNumber
        

            do {
                try viewContext.save()
                print("Item saved.")
                presentationMode.wrappedValue.dismiss()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        
        
    }
    

struct OrderEdit_Previews: PreviewProvider {
    static var previews: some View {
        OrderEdit()
    }
 }
}
