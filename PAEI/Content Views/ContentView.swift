//
//  ContentView.swift
//  PAEI
//
//  Created by Сергей on 02.01.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    
    var body: some View {
        ZStack {
            //            if !showSplash{
            WelcomeView()
                
                .opacity(!showSplash ? 1 : 0)
//                .animation(.easeIn)
            if showSplash {
            SplashScreen()
//                .opacity(showSplash ? 1 : 0)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation() {
                            showSplash = false
                        }
                    }
                }
                .animation(.easeIn)
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ScreenManager())
    }
}
