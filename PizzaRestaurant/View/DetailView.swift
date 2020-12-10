//
//  DetailView.swift
//  PizzaRestaurant
//
//  Created by Alexandre Lordelo on 2020-11-30.
//

import SwiftUI

struct DetailView: View {
    
    let pizzaTypes = ["Pizza Margherita", "Greek Pizza", "Pizza Supreme", "Pizza California", "New York Pizza"]
    
    @ObservedObject var order: Order   // << here !!

    
    
    @State var showOrderEdit = false


    var body: some View {
        
        Form{
        Text(order.flavor)

        Text(order.tableNumber)
        Text(order.pizzaType)
            
        }
        .navigationTitle(order.pizzaType)
        
        .toolbar {

            ToolbarItem(placement: .primaryAction) {
                
                
                //edit button
                Button(action: {
                    showOrderEdit = true
                }, label: {
                    Text("Edit")
                })
                .sheet(isPresented: $showOrderEdit) {
                    
                    //BB: Using the CoreData order instance to pass it down to the DetailEdit
                    DetailEdit(pizzaTypes: pizzaTypes, tableNumber: order.tableNumber, selectedPizzaIndex: pizzaTypes.firstIndex(of: order.pizzaType) ?? 00, numberOfSlices: Int(order.numberOfSlices), selectedFlavor: DetailEdit.Flavor(rawValue: order.flavor) ?? .chocolate, order: order)
                }
            }
        }

    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
