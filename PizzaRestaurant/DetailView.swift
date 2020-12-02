//
//  DetailView.swift
//  PizzaRestaurant
//
//  Created by Alexandre Lordelo on 2020-11-30.
//

import SwiftUI

struct DetailView: View {
    
    var order = Order()
    
    @State var showOrderEdit = false


    var body: some View {
        
        Form{
        
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
                    DetailEdit(order: order)
                    
                }
            }
        }

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
