//
//  ContentView.swift
//  PAEI
//
//  Created by Сергей on 02.01.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    @State private var showWelcomView = false
    var body: some View {
        ZStack {
            WelcomeView()
                .opacity(showWelcomView ? 1 : 0)
            
            if showSplash {
                SplashScreen()
                    .animation(.easeOut)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation() {
                                showWelcomView = true
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            withAnimation() {
                                showSplash = false
                            }
                        }
                    }
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
