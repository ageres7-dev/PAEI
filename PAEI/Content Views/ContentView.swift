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
            WelcomeView()
                .opacity(showSplash ? 0 : 1)
            
            if showSplash {
                SplashScreen()
                    .animation(.easeOut)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
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
