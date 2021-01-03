//
//  RadioButtonGroups.swift
//  PAEI
//
//  Created by Сергей on 03.01.2021.
//

import SwiftUI

struct RadioButtonGroups: View {
//    @State private var currentValue = 4
    @Binding var currentValue: Int
    let availablePoints: Int
    
    var body: some View {
        HStack {
            RadioButton(value: $currentValue,
                        id: 1,
                        availablePoints: availablePoints)
            Spacer()
            RadioButton(value: $currentValue,
                        id: 2,
                        availablePoints: availablePoints)
            Spacer()
            RadioButton(value: $currentValue,
                        id: 3,
                        availablePoints: availablePoints)
            Spacer()
            RadioButton(value: $currentValue,
                        id: 4,
                        availablePoints: availablePoints)
        }
        .frame(minHeight: 60, maxHeight: 90)
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
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

            SimpleCircleButton(
                isMarked: value == id,
                isOn: id <= availablePoints + value,
                action: {value = id}
            )

        }
//        .padding()
    }
}


struct RadioButtonGroups_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonGroups(currentValue: .constant(2), availablePoints: 1)
//        RadioButtonGroups(availablePoints: 1)
        
    }
}
