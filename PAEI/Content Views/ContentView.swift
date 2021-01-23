//
//  ContentView.swift
//  PAEI
//
//  Created by Сергей on 02.01.2021.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        WelcomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ScreenManager())
    }
}
