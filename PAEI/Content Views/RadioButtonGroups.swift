//
//  RadioButtonGroups.swift
//  PAEI
//
//  Created by Сергей on 03.01.2021.
//

import SwiftUI

struct RadioButtonGroups: View {
//    @State private var first = false
    @State private var currentValue = 0
    let availablePoints: Int
    
    var body: some View {
        HStack {
//            CircleButton(isMarked: $first, isOn: true)
            
            RadioButton(value: $currentValue, id: 1, availablePoints: availablePoints)
            
            RadioButton(value: $currentValue, id: 2, availablePoints: availablePoints)
            RadioButton(value: $currentValue, id: 3, availablePoints: availablePoints)
            RadioButton(value: $currentValue, id: 4, availablePoints: availablePoints)
        }
        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}



struct RadioButton: View {
    @Binding var value: Int
    let id: Int
    let availablePoints: Int
    
    var body: some View {
        VStack {
            Text("\(id)")
                .font(.title)
                .multilineTextAlignment(.center)

            SimpleCircleButton(
                isMarked: value == id,
                isOn: id <= availablePoints,
                action: {value = id}
            )

        }
//        .padding()
    }
}


struct RadioButtonGroups_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonGroups(availablePoints: 2)
    }
}
