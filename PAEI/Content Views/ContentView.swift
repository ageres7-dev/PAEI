//
//  ContentView.swift
//  PAEI
//
//  Created by Сергей on 02.01.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 1
    
    var body: some View {
//        CharacteristicsRadioButtonGroup()
//        PassingTest()
        WelcomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
