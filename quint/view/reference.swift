//
//  reference.swift
//  quint
//
//  Created by Zakki Mudhoffar on 21/05/22.
//

import SwiftUI

struct reference: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.edgesIgnoringSafeArea(.all)
                VStack {
                    // This handles the display of the
                    // section header
                    HStack {
                        // The text & spacer are grouped
                        // so that you can pad accordingly
                        Text("Stuff")
                        Spacer()
                    }
                    .padding(.bottom, 2)
                    .padding(.leading, 10)
                    // A VStack contains your list of items
                    VStack {
                        ForEach(0...3, id: \.self) { element in
                            // Each grouping (a product for you)
                            // will exist within this top level
                            // HStack
                            HStack {
                                // A new HStack (or another view of
                                // your choice) will contain the views
                                // that compose your product entry
                                HStack {
                                    Text("\(element)")
                                    Spacer()
                                }
                                .padding() // Provides some buffer around the product
                                .background(Color.white)
                                .contentShape(Rectangle()) // For tapping
                                .cornerRadius(5.0)// Rounding!
                            }
                            // Custom padding can tailor your spacing needs
                            .padding([.top, .bottom], 2)
                            .padding([.trailing, .leading], 10)
                        }
                    }
                    Spacer()
                }
            }
            .navigationTitle("Produk")
        }
    }
}

struct reference_Previews: PreviewProvider {
    static var previews: some View {
        reference()
    }
}
